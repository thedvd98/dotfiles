# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=10
export HISTFILESIZE=0
export HISTCONTROL=ignoredups

alias sysinfo='uname -som; uptime; free -h'
alias ls='ls --color=auto'
alias e="emacsclient --socket-name=/tmp/emacs$(id -u)/server -nw"
alias feh='feh -F'
alias csi='csi -q'
alias alpine='qemu-system-x86_64 -enable-kvm -m 512 -nic user,hostfwd=tcp::10022-:22 -hda ~/qemu/alpine.qcow2'
alias gentoo_upgrade='doas emerge --ask --verbose --update --deep --changed-use @world'
alias did='vim -c "$ r !date" ~/src/fatto.txt'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
export PS1="\[${bold}\]\[$cyan\]$(iamintotmux)\W \[${normal}\]λ "

# Key bindings
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOc":forward-word'
bind '"\eOd":backward-word'

PATH="${PATH}:$HOME/bin:$HOME/go/bin:$HOME/.local/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/"
export STUDIO_JDK="/usr/lib/jvm/java-8-openjdk"
export HTB="$HOME/src/wargames/htb/"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;


export YARA_INDEX="$HOME/var/yara/rules/index.yar"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
