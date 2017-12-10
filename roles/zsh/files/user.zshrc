if [[ -o login ]]; then
  export VISUAL=vim
  export EDITOR="$VISUAL"
  # Where did this come from?
  # export MANPATH="/usr/local/man:$MANPATH"
fi
