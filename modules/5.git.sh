# git autocompletion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# sweeeeet PS1 for git status junk
function git_prompt(){
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]
    then
        if [ -n "$(git status -z 2>/dev/null)" ]
        then
            printf "\033[31m{$branch}\033[0m "
        else
            printf "\033[32m($branch)\033[0m "
        fi
    fi
}

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
