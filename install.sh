#!/usr/bin/env bash

# Clone if not found
if ! [ -d "$HOME/.dotfiles" ]; then
	echo 'Cloning repository'
	git clone https://github.com/renan/dotfiles.git $HOME/.dotfiles
fi

# Iterate through install.sh files
for file in `find $HOME/.dotfiles -name install.sh`; do
	# Not self file
	if [ "$file" != "$HOME/.dotfiles/install.sh" ]; then
		# Execute the install
		$file
		echo
	fi
done
