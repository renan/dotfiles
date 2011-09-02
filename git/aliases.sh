#!/usr/bin/env bash
#
# IF you use this be aware this could break stuffs and if it does complain to Mark Story
# (https://github.com/markstory/dotfiles/blob/master/section/aliases.sh)
#

#
# Does a rebase pull + stash so I can be extra lazy.
#
# usage: gpull origin
gpull () {
	local s
	local head
	s=$(git stash 2>/dev/null)
	head=$(basename $(git symbolic-ref HEAD 2>/dev/null) 2>/dev/null)
	if [ "" == "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$s"
		return 1
	fi
	if [ "$1" = "" ]; then
		echo "No remote selected, can't pull"
		__git_stash_pop "$s"
		return 2
	fi
	git fetch -a $1
	git pull --rebase $1 "$head"
	__git_stash_pop "$s"
	return 0
}

#
# Push the current branch with a remote specifier
#
gpush () {
	local head
	head=$(basename $(git symbolic-ref HEAD 2>/dev/null) 2>/dev/null)
	if [ "" = "$head" ]; then
		echo "Not on a branch, can't push"
		return 1
	fi
	if [ "$1" = "" ]; then
		echo "No remote selected can't push"
		return 2
	fi
	git push "$1" "$head"
}

__git_stash_pop () {
	[ "$1" != "No local changes to save" ] && git stash pop
}
