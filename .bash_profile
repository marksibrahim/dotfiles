# .bash_profile
# Get the aliases and functions
source ~/.bashrc

#adds directory to title bar of iterm
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"';
fi
#path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#vacc shortcut
alias vacc="ssh msibrahi@bluemoon-user1.uvm.edu"

#useful 
alias cpwd="pwd | tr -d '\n' | pbcopy" #copy current working directory
alias lf="ls -AlFGh"
alias rm="rm -i" #ask for confirmation before rm

#alias vim to use MacVim's faster rendering engine
alias vim="mvim -v"



#virtualenv for wrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

##PROMOPT

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#color of prompt 
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]happy:\[\033[34;2m\]\w\[\033[30;2m\]\$(parse_git_branch)\[\033[m\] \$ "

#git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

#Serve Jekyll Blog
alias serve_blog="jekyll serve --baseurl ''"
#public internet id changer
function remac {
    sudo /System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -z
    sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
    sudo networksetup -detectnewhardware
    echo $(ifconfig en0 | grep ether)
}

