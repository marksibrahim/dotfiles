# .bash_profile
# Get the aliases and functions
source ~/.bashrc

#===========================ALIASES===============================
# vacc shortcut
alias vacc="ssh msibrahi@bluemoon-user1.uvm.edu"

# useful 
alias cpwd="pwd | tr -d '\n' | pbcopy" #copy current working directory
alias lf="ls -AlFGh"
alias rm="rm -i" #ask for confirmation before rm

# Serve Jekyll Blog
alias serve_blog="jekyll serve --baseurl ''"

#===========================PROMPT===============================
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]happy:\[\033[34;2m\]\w\[\033[32;1m\]\$(parse_git_branch)\[\033[m\] \$ "
# shorterns path; requires Bash Version > 4.0 
export PROMPT_DIRTRIM=3

#adds directory to title bar of iterm
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"';
fi


#===========================OTHER===============================
#git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

#Homebrew installs applications in usr/local/bin
	#tell OS to use programs in this directory
export PATH=/usr/local/bin:$PATH

# virtual environment wrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh


