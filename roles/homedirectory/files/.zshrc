fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


# プロンプト
autoload -U colors; colors
local p_current="[%{$fg[red]%}%~%{$reset_color%}]"$'\n'
local p_info="%F{yellow}%n@%m%f > "
PROMPT="$p_current$p_info"
RPROMPT='%F{yellow}[%D]%f'
setopt transient_rprompt
setopt auto_param_slash
setopt auto_menu
setopt auto_param_keys
setopt complete_in_word
setopt always_last_prompt
setopt magic_equal_subst
zstyle ':completion:*:default' menu select=2


# エイリアスいろいろ
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -F --color'
#alias ls="ls -FHG" #Mac
alias ll='ls -Fl'
alias la='ls -Fla'
alias v='vim -R'
alias p='pwd'
alias mv='mv -vi'
alias cp='cp -vi'
alias rm='rm -vi'
# alias diff='colordiff -u'
alias less='less -R'
#alias top='htop'
alias wee='weechat-curses'
alias iftop='/usr/local/Cellar/iftop/1.0pre2/sbin/iftop'


# ~/.ssh/known_hostsをつかったホスト名の補完
function print_known_hosts (){
  if [ -f $HOME/.ssh/known_hosts ]; then
    cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
  fi
}
_cache_hosts=($( print_known_hosts ))


#tmux 
function tm() { 
       if [ -n "${1}" ]; then
           tmux attach-session -t ${1} || \
           tmux new-session -s ${1}
    else
           tmux attach-session || \
           tmux new-session
       fi
}

if [ -x "`which go`" ]; then
       export GOROOT=`go env GOROOT`
       export GOPATH=$HOME/code/go-local
       export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
 fi

