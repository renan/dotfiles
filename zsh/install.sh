#!/usr/bin/env bash

echo 'Installing zsh'
brew install zsh zsh-completions

if [ -f "$HOME/.zshrc" ] && [ -f "$HOME/.zshrc-pre-dotfiles" ]; then
	echo '- Removing old .zshrc'
	rm "$HOME/.zshrc"
elif [ -f "$HOME/.zshrc" ]; then
	echo '- Backing up .zshrc to .zshrc-pre-dotfiles'
	mv "$HOME/.zshrc" "$HOME/.zshrc-pre-dotfiles"
fi

echo 'Installing new .zshrc'
ln -s "$HOME/.dotfiles/zsh/profile" "$HOME/.zshrc"

echo 'Cloning oh-my-zsh'
git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.oh-my-zsh"
