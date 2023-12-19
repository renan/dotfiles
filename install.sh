#!/usr/bin/env bash

# Install needed/desired packages
brew install git tig gpg2 gnupg pinentry-mac
brew install ansible terraform curl gsed htop ncdu tree watch kubernetes-cli helm jq

brew tap johanhaleby/kubetail
brew install kubetail

brew install --cask git-credential-manager
brew install --cask 1password/tap/1password-cli

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
