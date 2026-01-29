#!/bin/bash
#
# Instalils a custom tmux configuration that make "tmux great again"
#
tmux_env_archive="${1:-tmux-env.tgz}"

# Deploye custom tmux environment
cd $HOME
tar -zxf "$tmux_env_archive"

# Setup symlinks for Ubuntu
ln -s "$HOME/tmux/oh-my-tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/tmux/oh-my-tmux/.tmux.conf.local.u2004dvm" "$HOME/.tmux.conf.local"

# Create the location to save tmux history
mkdir -p "$HOME/.tmux.history"

# Installation info
echo "tmux hostkey [ctrl + a]"
echo "tmux config root directory: $HOME/tmux"
echo "Base tmux config: $HOME/.tmux.conf"
echo "User/OS specific tmux config: $HOME/.tmux.conf.local"
echo "Location where tmux history is saved [ctrl + a, shift + h, press enter]: $HOME/.tmux.history"
echo "Tmux cache and plugin install location: $HOME/.tmux"

# Install "tmuxp" (Optional - Session manager)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux

    # Debian / Ubuntu base distros (or you have apt)
    if ! command -v apt >/dev/null 2>&1; then
        sudo apt install tmuxp
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    if ! command -v brew >/dev/null 2>&1; then
        brew install tmuxp
    fi

fi