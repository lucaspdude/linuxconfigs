#!/bin/bash
#sets symlink to alacritty config

echo "Creating symlinks for alacritty terminal configs"
ln -s .config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo "Creating symlinks for fish shell configs and aliases"

ln -s .config/fish/config.fish $HOME/.config/fish/fish.config
ln -s .config/fish/functions/sail.fish $HOME/.config/fish/functions/sail.fish


echo "Creating symlinks for multiple account  ssh configs"

ln -s .ssh/config $HOME/.ssh/config

echo "Creating SSH key for personal github account";
echo "Enter your PERSONAL GITHUB account email";
read githubpersonalemail
ssh-keygen -t rsa -b 4096 -C "${githubpersonalemail}"




echo "Creating SSH key for WORK github account";
echo "Enter your WORK GITHUB account email";
read githubworkemail
ssh-keygen -t rsa -b 4096 -C "${githubworkemail}"



echo "Creating SSH key for GITLAB account";
echo "Enter your PERSONAL GITLAB account email";
read gitlabemail
ssh-keygen -t rsa -b 4096 -C "${gitlabemail}"


echo "Creating SSH key for AZURE account";
echo "Enter your PERSONAL AZURE  account email";
read gitlabemail
ssh-keygen -t rsa -b 4096 -C "${gitlabemail}"


echo "Eval and add keys to ssh agent"
eval ssh-agent -s

ssh-add $HOME/.ssh/github
ssh-add $HOME/.ssh/work
ssh-add $HOME/.ssh/gitlab
ssh-add $HOME/.ssh/azure
