PATH="${PATH}:$HOME/bin:$HOME/go/bin:$HOME/.local/bin"

. /home/anon/.nix-profile/etc/profile.d/nix.sh

eval $(opam env)

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# if running bash
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

export PATH="$HOME/.elan/bin:$PATH"
. "$HOME/.cargo/env"
