#!/bin/bash

# Get user info
read -p "Enter your GitHub E-Mail: " gh_email
read -p "Enter your GitHub username: " gh_username

mkdir ~/.config
pacman --noconfirm -Syu
pacman --noconfirm -S base-devel git rust npm python go neofetch plasma plasma-wayland-session nvidia bpytop eza alacritty keepassxc nerd-fonts spotify-launcher discord firefox zsh

# Installing omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Creating symlink for .zshrc
rm ~/.zshrc
ln -s ./.zshrc ~/.zshrc
# Installing p10k through omz
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Setting up git
git config --global user.email "'$gh_email'"
git config --global user.name "'$gh_username'"
mkdir ~/.ssh
ssh-keygen -t ed25519 -C "'$gh_email'" -f ~/.ssh/github -q -N ""
exec ssh-agent zsh
ssh-add ~/.ssh/github
cp ./config ~/.ssh/config

# Creating symlink for alacritty config
ln -s ./alacritty ~/.config/

# Configuring nvim
# Installing NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
# Creating symlink for custom config
rm -r ~/.config/nvim/lua/custom
ln -s ../nvchad/custom ~/.config/nvim/lua/

# Disable sddm mouse acceleration
cp ./sddm/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf


# KDE global theme: Uzuri V2 Dark
