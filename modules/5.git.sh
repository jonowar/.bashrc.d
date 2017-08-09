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

# configuring git ps1
git_prompt_ps1='$(__git_ps1 "(%s)")\$ '
PROMPT_COMMAND="__git_ps1 \"$PS1\" \"\\\$ \""
GIT_PS1_SHOWCOLORHINTS=true # use color in git_ps1
GIT_PS1_SHOWDIRTYSTATE=true # * = unstaged, + = staged
GIT_PS1_SHOWSTASHSTATE=true # $ = something stashed
GIT_PS1_SHOWUNTRACKEDFILES=true # % if something untracked
GIT_PS1_HIDE_IF_PWD_IGNORED=true # hide git_ps1 in .gitignore'd directories
GIT_PS1_SHOWUPSTREAM="auto" # < = behind, > = ahead, <> = diverged, = = no difference

# alias lg command to show git log in a pretty format
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
