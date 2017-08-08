# history stuff
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000

logs_dir="$HOME/.logs"
mkdir -p $logs_dir

# Log bash history (https://spin.atomicobject.com/2016/05/28/log-bash-history/)
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> $logs_dir/bash-history-$(date "+%Y-%m-%d").log; fi'

# Search through command history
function loggrep(){
    grep $1 ~/.logs/*
}
