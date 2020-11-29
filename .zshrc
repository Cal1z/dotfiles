# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle :compinstall filename '/home/marvin/.zshrc'

autoload zmv
autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd autopushd extendedglob notify
bindkey -e
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
PROMPT=" %B%(?.%F{251}.%F{red})$%f%b "
RPROMPT=" %F{blue}%~%f "
export PATH=/home/marvin/.local/bin:$PATH
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias ls='ls --color=tty'
alias grep='grep --color=auto'
DIRSTACKSIZE=8
setopt pushdminus pushdsilent pushdtohome pushdignoredups
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
alias d='dirs -v | head -4'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias msf='/usr/local/bin/msfconsole'
alias cat='bat --pager=never'
alias less='bat'
alias vim='nvim'
alias ff='xdg-open "$(fzf)"'
alias la='ls -a'
alias thm='sudo openvpn ~/tryhackme/mm4rks.ovpn'
alias fkie='~/0xff/tmux.sh'
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s main
# fi
function ts {
  args=$@
  tmux send-keys -t right "$args" C-m
}
function pycov {
    if [ $# -eq 2 ]; then
      # 1st argument test folder, second module
      pytest --cov-report=html --cov=$argv[2] $argv[1]
    else
      echo "Usage: ${FUNCNAME[0]} <test folder> <module>"
    fi
}
function watchfolder {
  if [ $# -ge 2 ]; then
    echo "[+] watching folder $argv[1]: ${@:2}"
    inotifywait -q -m -e close_write -r $argv[1] --exclude \[0-9\]+ |
      while read; do
        ${@:2}
      done
  else
    echo "Usage: ${FUNCNAME[0]} <folder> <command>"
  fi
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias config='/usr/bin/git --git-dir=/home/marvin/.cfg/ --work-tree=/home/marvin'
alias nikto='perl ~/.tools/nikto/program/nikto.pl'
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'
