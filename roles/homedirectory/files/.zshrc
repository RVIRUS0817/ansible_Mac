export PATH="/usr/local/sbin:$PATH"

fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1
function history-all { history -E 1 }
setopt +o nomatch 

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプト
autoload -U colors; colors
setopt transient_rprompt
setopt auto_param_slash
setopt auto_menu
setopt auto_param_keys
setopt complete_in_word
setopt always_last_prompt
setopt magic_equal_subst
zstyle ':completion:*:default' menu select=2

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}adachin@%f: %F{cyan}%~%f %F{yellow}$(__git_ps1 "(%s)")%f
\$ '

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# エイリアスいろいろ
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -F --color'
alias ls="ls -FHG" #Mac
alias ll='ls -Fla'
alias la='ls -Fla'
alias v='vim -R'
alias p='pwd'
alias mv='mv -vi'
alias cp='cp -vi'
alias rm='rm -vi'
alias vim='vim'
alias more='bat'
alias less='less -R'
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

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#python
export PATH="$HOME/.pyenv/shims:$PATH"

### history
function peco-history-selection() {
    BUFFER=`history 1 | tail -r | awk '{$1="";print $0}' | egrep -v "ls" | uniq -u | sed 's/^ //g' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^H' peco-history-selection

### peco&ssh
function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/conf.d/*/config_* | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh -A ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh
bindkey '^J' peco-ssh

## ghq
alias repo='cd $(ghq list --full-path --exact| peco)'

export LC_ALL='ja_JP.UTF-8'
export LANG=en_US.UTF-8

## node
export PATH=$HOME/.nodebrew/current/bin:$PATH

## PHP 
export PATH="/usr/local/opt/php@7.4/bin:$PATH"    
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"    

