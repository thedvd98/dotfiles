# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=10
export HISTFILESIZE=0
export HISTCONTROL=ignoredups

alias sysinfo='uname -som; uptime; free -h'
alias ls='ls --color=auto'
alias e='emacs -nw'
alias feh='feh -F'
alias csi='chicken-csi -q'
alias radio='mpv http://cyberadio.pw:8000/stream'
alias alpine='qemu-system-x86_64 -enable-kvm -m 512 -nic user,hostfwd=tcp::10022-:22 -hda ~/qemu/alpine.qcow2'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prompt
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
iamintotmux(){
	if [[ $TMUX ]]; then
		echo 'tmux@'
	else
		echo ''
	fi
}
bold=$(tput bold)
rev=$(tput rev)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
normal=$(tput sgr0)

#PS1='${GREEN}[\u@$(iamintotmux) \W]\$${RESET} '
export PS1="\[${bold}\]\[$cyan\]$(iamintotmux)\W \[${normal}\]λ "

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOc":forward-word'
bind '"\eOd":backward-word'

PATH="${PATH}:$HOME/bin:$HOME/go/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/"
export STUDIO_JDK="/usr/lib/jvm/java-8-openjdk"
