#!/usr/bin/env bash

# See: https://sublime.wbond.net/docs/syncing
echo 'Installing Sublime Text files ...'
ln -s "$HOME/.dotfiles/SublimeText/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
