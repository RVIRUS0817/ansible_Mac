if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
  fi

  export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad
  export PS1="\[\e[1;32m\][@\h:\W \d \t]\$\[\e[00m\] "
  export PS1="\[\e[1;32m\][\u@\h:\W \d \t]\$\[\e[00m\] " #ユーザ名付き


# exec $SHELL -l シェル再起動
