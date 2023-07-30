#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Vars
resolution="1280x800"


# Functions

lscool(){
	ls /dev/pts/2>/dev/null 2>/dev/null
	if [ $? -eq 0 ]
	then
        	cd $1;
        	clear > /dev/pts/2;
        	ls --color=auto > /dev/pts/2;
	else
		cd $1;
	fi
}
to_trash(){
	mv $1 /home/archli/.trash
}

gitpkg(){
	TEMP_GITPKG=$(pwd)
	cd /home/archli/Downloads/git-pkg && git clone $1 && cd $2 && makepkg -si && cd $TEMP_GITPKG
}

migrate(){
	cp $1 $MIGRATE_DIR 
}



# Aliases

alias ls='ls --color=auto'
alias 's'='sudo'
#alias 'grep'='grep --color=always'
#alias 'chown'='chown -R archli:archli'
alias 'pacman'='sudo pacman --color always'
#alias 'cdd' ='cd'
#alias 'cd'='lscool'
alias 'conf'='nano /home/archli/.config/i3/config'
alias 'config'='nano /home/archli/.config/i3/config'
alias 'logusremuvos'='history -c'
alias 'createcpp'='cp /home/archli/programming/cpp/.template.cpp main.cpp && micro main.cpp'
alias 'cppcreate'='cp /home/archli/programming/cpp/.template.cpp main.cpp && micro main.cpp'
alias 'vscode'='code'
alias 'mkinitcpio'='sudo mkinitcpio -p linux'
alias 'sl'='sl -e'
alias 'rem'='to_trash'
alias 'python'='python3'
alias 'setwall'='feh --bg-fill'
alias 'rm'='rm -v'
alias 'cp'='cp -v'
alias 'mv'='mv -v'
alias 'pg'='ping 8.8.8.8'
alias 'rans'='ansible-playbook -e ansible_user=javormic --become -i inventory/hosts.yml'

# Git aliases
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gcb='git checkout -b'
alias gcl='git clone --recurse-submodules'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gsb='git status --short --branch'

# No duplicates in history
export HISTCONTROL=ignoredups

# Pacman colors
export TERM=xterm-256color
