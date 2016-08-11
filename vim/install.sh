#!/usr/bin/env bash

echo 'Installing vim files ...'

# Profile
if [ -f "$HOME/.vimrc" ] && [ -f "$HOME/.vimrc.bak" ]; then
	echo '- Removing old .vimrc'
	rm "$HOME/.vimrc"
elif [ -f "$HOME/.vimrc" ]; then
	echo '- Backing up .vimrc to .vimrc.bak'
	mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
fi

echo '- Installing new .vimrc'
ln -s "$HOME/.dotfiles/vim/profile" "$HOME/.vimrc"
