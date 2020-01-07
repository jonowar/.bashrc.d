# git autocompletion
git_completion_file=$HOME/.git-completion.bash
git_completion_url="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"

if [ ! -f $git_completion_file ]; then
    echo "
** git autocompletion not installed. installing from $git_completion_url..."
    curl -s -o $git_completion_file $git_completion_url
    echo "** done.
"
fi
source $git_completion_file


# git prompt
git_prompt_file=$HOME/.git-prompt.sh
git_prompt_url="https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"

if [ ! -f $git_prompt_file ]; then
    echo "
** git prompt not installed. installing from $git_prompt_url..."
    curl -s -o $git_prompt_file $git_prompt_url
    echo "** done.
"
fi
source $git_prompt_file

# SCM_BREEZE
if [ -s "$HOME/.scm_breeze/scm_breeze.sh" ]; then
    source "$HOME/.scm_breeze/scm_breeze.sh"
    git_index --rebuild
    update_scm_breeze
else
    echo "scm_breeze not installed. do this:

    git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
    ~/.scm_breeze/install.sh

then you can delete the line that it adds to your .bashrc
"
fi

# configuring git ps1
git_prompt_ps1='$(__git_ps1 "(%s)")\$ '
export PROMPT_COMMAND="__git_ps1 \"$PS1\" \"\\$HI_Purple\$$Color_Off \";$PROMPT_COMMAND"
GIT_PS1_SHOWCOLORHINTS=true # use color in git_ps1
GIT_PS1_SHOWDIRTYSTATE=true # * = unstaged, + = staged
GIT_PS1_SHOWSTASHSTATE=true # $ = something stashed
GIT_PS1_SHOWUNTRACKEDFILES=true # % if something untracked
GIT_PS1_HIDE_IF_PWD_IGNORED=true # hide git_ps1 in .gitignore'd directories
GIT_PS1_SHOWUPSTREAM="auto" # < = behind, > = ahead, <> = diverged, = = no difference

# alias lg command to show git log in a pretty format
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

# fetch and checkout specific PRs
git config --global alias.fetch-pr "!bash -xc 'git fetch upstream pull/\$0/head:\${1:-pr-\$0}'"
git config --global alias.checkout-pr "!bash -xc 'git fetch-pr \$0 \${1:-pr-\$0} && git checkout \${1:-pr-\$0}'"
git config --global alias.rebase-master "!git checkout master && git pull && git checkout - && git rebase master"

function grebi(){
    git rebase -i HEAD~$1
}

unalias gush
function gush(){
    git push -f --set-upstream origin `git rev-parse --abbrev-ref HEAD`
}

# Gets the url for the current git repository
function repo_url(){
  remote_url=$(git config --get remote.origin.url)
  if [ "$remote_url" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  repo_url=$(echo $remote_url | sed -E "s/git@([a-z.]+)\:([a-z/-]+)\.git/https\:\/\/\1\/\2/g")
  echo $repo_url
}

# Opens the github page for the current git repository in your browser
function gohub() {
  url=$(repo_url)
  open $url
}

# Opens the github page to create a new pull request on the current branch against master
function gopr() {
  repo_url=$(repo_url)
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  pr_url="$repo_url/compare/master...$branch_name?expand=1"

  open $pr_url
}
