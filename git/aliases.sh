#!/usr/bin/env bash
#
# Does a rebase pull + stash so I can be extra lazy.
#
# usage: gpull
gpull () {
	local stash
	local head
	stash=$(git stash 2>/dev/null)
	head=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ "" = "$head" ]; then
		echo "Not on a branch, can't pull"
		__git_stash_pop "$stash"
		return 1
	fi
	git fetch -a origin
	git pull --rebase origin "$head"
	__git_stash_pop "$stash"
	return 0
}

#
# Push the current branch
#
gpush () {
	local head
	head=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ "" = "$head" ]; then
		echo "Not on a branch, can't push"
		return 1
	fi
	git push origin "$head"
}

__git_stash_pop () {
	[ "$1" != "No local changes to save" ] && git stash pop
}
