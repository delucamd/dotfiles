alias h='cd $HOME'
alias c='clear'

#  dotfiles
#------------------------------------------------
alias dotfiles.reload='$HOME/.dotfiles/install'

# ls - list directory contents
#------------------------------------------------
alias ls='ls --color -Fh'
alias ll='ls --color -lh'
alias la='ls --color -A'
alias lla='ls --color -lAh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# grep - print lines matching pattern
#------------------------------------------------
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# apt - package management
#------------------------------------------------
alias apt.update='sudo apt-get update'
alias apt.upgrade='sudo apt-get upgrade'
alias apt.remove='sudo apt autoremove'

# ssh - remote login
#------------------------------------------------
alias ssh.list='ssh-add -l'
alias ssh.lock='ssh-add -x'
alias ssh.unlock='ssh-add -X'
alias ssh.rmall='ssh-add -D'

ssh.add() {
    if [ -n $1 ] && [ -f $HOME/.ssh/id_$1 ]; then
        ssh-add -t 86400 $HOME/.ssh/id_$1
    elif [ -z $1 ] && [ -f $HOME/.ssh/id_$USER ]; then
        ssh-add -t 86400 $HOME/.ssh/id_$USER
    else
        echo "Invalid key. Please try again"
    fi
}

ssh.rm() {
    if [ -n $1 ] && [ -f $HOME/.ssh/id_$1 ]; then
        ssh-add -d $HOME/.ssh/id_$1
    elif [ -z $1 ] && [ -f $HOME/.ssh/id_$USER ]; then
        ssh-add -d $HOME/.ssh/id_$USER
    else
        echo "Invalid key. Please try again"
    fi
}

# Local Customizations
#------------------------------------------------
if [ -f $HOME/.bash_aliases.local ]; then
    source $HOME/.bash_aliases.local
fi
