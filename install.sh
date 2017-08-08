bashrcd_comment='# added by .bashrc.d/install.sh'
bashrcd_command='for file in `find $HOME/.bashrc.d/modules/* | grep "/[0-9]\..*[0-9a-zA-Z]$"`; do echo $file; source $file; done'

if [ -s "$HOME/.bashrc" ] && grep -q "$bashrcd_comment" "$HOME/.bashrc"; then
  printf "== Already installed in '~/.bashrc'\n"
else
  printf "\n$bashrcd_comment\n$bashrcd_command\n" >> "$HOME/.bashrc"
  printf "== Added bashrc.d to '~/.bashrc'\n"
fi
