#!/usr/bin/env bash

echo 'Installing bash files ...'

# Profile
if [ -f "$HOME/.bash_profile" ] && [ -f "$HOME/.bash_profile.bak" ]; then
	echo '- Removing old .bash_profile'
	rm "$HOME/.bash_profile"
elif [ -f "$HOME/.bash_profile" ]; then
	echo '- Backing up .bash_profile to .bash_profile.bak'
	mv "$HOME/.bash_profile" "$HOME/.bash_profile.bak"
fi

echo '- Installing new .bash_profile'
ln -s "$HOME/.dotfiles/bash/profile" "$HOME/.bash_profile"

# Dircolors
if [ "$(uname -s)" != "Darwin" ]; then
	if [ -f "$HOME/.dircolors" ] && [ -f "$HOME/.dircolors.bak" ]; then
        	echo '- Removing old .dircolors'
	        rm "$HOME/.dircolors"
	elif [ -f "$HOME/.dircolors" ]; then
	        echo '- Backing up .dircolors to .dircolors.bak'
	        mv "$HOME/.dircolors" "$HOME/.dircolors.bak"
	fi

	echo '- Installing new .dircolors'
	ln -s "$HOME/.dotfiles/bash/dircolors" "$HOME/.dircolors"
fi

