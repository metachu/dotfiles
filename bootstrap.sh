#!/bin/bash
USERNAME=william
#sudo apt-get update
#sudo apt-get upgrade

sudo apt-get install vim emacs i3-wm tree htop git fish stow feh i3 i3-status thefuck python-pip fonts-font-awesome gmrun chromium-browser

echo "Enter password for use $USERNAME to change shell to fish:"
chsh -s /usr/bin/fish

rm ~/.bashrc

cd ~/dotfiles
stow laptop

cd ~
echo "Installing oh my fish"
curl -L http://get.oh-my.fish | fish

omf install robbyrussell

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

