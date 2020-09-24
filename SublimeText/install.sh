#!/usr/bin/env bash

# See: https://sublime.wbond.net/docs/syncing
echo 'Installing Sublime Text files ...'
rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
ln -s "$HOME/.dotfiles/SublimeText/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
