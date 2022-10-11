export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/bin/zk
export ZK_NOTEBOOK_DIR="$HOME/Documents/Notes/"
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
. "$HOME/.cargo/env"

export EDITOR='nvim'
export VISUAL='nvim'

alias cleands='find . -name ".DS_Store" -exec rm {} \;'
alias jn='jupyter notebook'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias c='clear'
alias brewall='brew update && brew upgrade && brew doctor && brew cleanup && brew autoremove'
alias brewdtree='brew deps --tree --installed'
alias lg=lazygit
alias ld=lazydocker
alias t='tmux'
alias tks='tmux kill-session'

if command -v nvim &> /dev/null
then
	alias vim=nvim
fi

if command -v exa &> /dev/null
then
	alias l='exa'
	alias ls='exa'
	alias ll='exa -ll'
	alias la='exa -la'
fi


if [[ $TERM == "xterm-kitty" ]]; then
	alias ssh="kitty +kitten ssh"
fi

# function to mkdir and cd into it
function mkcd() {
	mkdir -p $1
	cd $1
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="[\A] \W \`parse_git_branch\` $ "

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
