# PS1 terminal prompt coloring
pre_ps1="$HI_Cyan\u$Purple@$HI_Green\h:$HI_Blue\w$Color_Off"
PS1=$pre_ps1' $(\
  if [ -n "$(git status -z 2>/dev/null)" ]; then \
    echo "'$Red'"; \
  else \
    echo "'$Green'"; \
  fi)'"\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)$Color_Off$ "
