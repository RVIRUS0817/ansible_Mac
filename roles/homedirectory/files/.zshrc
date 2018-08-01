fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1
function history-all { history -E 1 }


# プロンプト
autoload -U colors; colors
local p_current="[%{$fg[red]%}%~%{$reset_color%}]"$'\n'
local p_info="%F{yellow}adachin@%m%f > "
PROMPT="$p_current$p_info"
RPROMPT='%F{yellow}[%D]%f$(git-prompt)'
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
alias ls="ls -FHG" #Mac
alias ll='ls -Fl'
alias la='ls -Fla'
alias v='vim -R'
alias p='pwd'
alias mv='mv -vi'
alias cp='cp -vi'
alias rm='rm -vi'
alias vim='nvim'
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


# ブランチ名を色付きで表示させるメソッド
function git-prompt {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

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
alias repo='ghq look $(ghq list | peco)'
