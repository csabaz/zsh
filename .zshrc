
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _list _expand _complete _ignored _match _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '$HOME/.zshrc'
# End of lines added by compinstall

# AUTOCOMPLETION

autoload bashcompinit
bashcompinit

# initialize autocompletion
autoload -Uz compinit
compinit

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.histfile
SAVEHIST=20000
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt autocd extendedglob nomatch
unsetopt beep notify

###############################################################
# autocompletion using arrow keys (based on history)
## mkdir -p ~/zsh/zhist && git clone https://github.com/zsh-users/zsh-history-substring-search ~/zsh/zhist
# update zhist 
## cd ~/zsh/zhis && git pull
###############################################################
# history search ctrl+r oh-my-zsh style
## mkdir -p ~/zsh/fzf && git clone --depth 1 https://github.com/junegunn/fzf.git ~/zsh/fzf/ && ~/zsh/fzf/install
# update fzf
## cd ~/zsh/fzf && git pull && ./install
#bindkey '^R' history-incremental-search-backward ## old
###############################################################
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/zhist/zsh-history-substring-search.zsh

#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# ctrl + arrow
export WORDCHARS='~!#$%^&*(){}[]<>?+;-'
autoload -U select-word-style
select-word-style normal
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# folder history
zle -N znt-cd-widget
bindkey "^P" znt-cd-widget

# ctrl-u - delete befor cursor
bindkey "^U" backward-kill-line


if command -v kubectl &>/dev/null 
then
	source <(kubectl completion zsh) 
	alias k=kubectl
	complete -F __start_kubectl k
	export KUBECONFIG=~/.kube/config
fi

if command -v helm &>/dev/null 
then
	source <(helm completion zsh)
fi

export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR
export SELECTED_EDITOR=$EDITOR
if [[ "$USER" =~ "root" ]] ; then
	PROMPT="%B%F{red}%n%f@%F{blue}%m%b%f[%F{yellow}%1~%f]%(!.#.$): "
else
	PROMPT="%B%F{green}%n%f@%F{blue}%m%b%f[%F{yellow}%1~%f]%(!.#.$): "
fi
#precmd() { print "" }

export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls="ls --group-directories-first --color"
alias ll="ls -l --group-directories-first --color"
alias la="ls -la --group-directories-first --color"

