if [ "$(uname -s)" == "Darwin" ]; then
	# Homebrew programs in top of PATH
	PATH=/usr/local/bin:$PATH
	export PATH

	# Homebrew tab completion.
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi
fi

# Colors
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

# Aliases
alias ls="ls -G"

if [ "$(uname -s)" == "Darwin" ]; then
	# PS1
	PS1='\u@\h:\w$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]") \$ '
fi

# History
## Append history on exit
shopt -s histappend

## Erase duplicates
export HISTCONTROL='erasedups'

## Big history
export HISTSIZE=5000
