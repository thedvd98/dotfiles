# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bashrc_`hostname` ]; then
    source ~/.bashrc_`hostname`
fi

alias sysinfo='uname -som; uptime; free -h'
alias redshift='redshift -l   42.83333:12.83333'
alias e="emacsclient -c --socket-name=/tmp/emacs$(id -u)/server"
alias feh='feh -F'
alias csi='csi'
alias alpine='qemu-system-x86_64 -enable-kvm -m 512 -nic user,hostfwd=tcp::10022-:22 -hda ~/qemu/alpine.qcow2'
alias scrcpy='scrcpy --render-driver=software'
alias my='cd $(find ~/src/miei/ -maxdepth 1 -type d | fzf)'

# Kubernetes!
alias kubectl='minikube kubectl --'

# Prompt
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
iamintotmux(){
	if [[ $TMUX ]]; then
		echo 'tmux '
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
export PS1="\[${bold}\]\[$green\][$(hostname)] \[$cyan\]\W \[${normal}\]λ "

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOc":forward-word'
bind '"\eOd":backward-word'

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups

export PROMPT_COMMAND="history -a; history -n"

export EDITOR="nvim"
export VISUAL="nvim"

export CHECK_IF_PREINSTALLED=false

export QT_XCB_GL_INTEGRATION=none # Used for solving some nix pkg installed programs problems

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/"
export STUDIO_JDK="/usr/lib/jvm/java-8-openjdk"
export HTB="$HOME/src/wargames/htb/"

export PATH="$HOME/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

export YARA_INDEX="$HOME/var/yara/rules/index.yar"
export YARA_FULL="$HOME/var/yara/yara-rules-full.yar"

# FZF

export FZF_ALT_C_OPTS="
  --walker-skip mnt
  --preview 'tree -C {}'"

# gcc useful flags -Wall -Wextra -Wshadow -Wconversion -Wfloat-equal -Wduplicated-cond -Wlogical-op
. "$HOME/.cargo/env"

source /usr/share/bash-completion/completions/fzf
