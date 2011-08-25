#!/usr/bin/env bash

echo 'Installing git files ...'

if [ -f "$HOME/.gitconfig" ] && [ -f "$HOME/.gitconfig.bak" ]; then
	echo '- Removing old .gitconfig'
	rm "$HOME/.gitconfig"
elif [ -f "$HOME/.gitconfig" ]; then
	echo '- Backing up .gitconfig to .gitconfig.bak'
	mv "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
fi

echo '- Installing new .gitconfig'
ln -s "$HOME/.dotfiles/git/config" "$HOME/.gitconfig"
