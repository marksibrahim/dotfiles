# .bash_profile
# Get the aliases and functions
source ~/.bashrc

# Source .specifics (for machine specific configs) if it exists
if [ -f $HOME/.specifics ]; then
    source $HOME/.specifics
else
   echo "no machine specific bash configs to source"
fi

#===========================ALIASES===============================
# vacc shortcut
alias vacc="ssh msibrahi@bluemoon-user1.uvm.edu"

# useful 
alias cpwd="pwd | tr -d '\n' | pbcopy" #copy current working directory
alias lf="ls -AlFGh"
alias rm="rm -i" #ask for confirmation before rm
alias path='echo -e \\t${PATH//:/\\n\\t}' #displays path in a nice format (from Bagrow/Andy)

# Serve Jekyll Blog
alias serve_blog="jekyll serve --baseurl ''"

# open current directory in Intellij
alias intellij="open -a /Applications/IntelliJ\ IDEA.app/ ."

#===========================PROMPT===============================
COLOR_GREEN="\[\033[36m\]"
COLOR_YELLOW="\[\033[32m\]"
COLOR_BLUE="\[\033[34;2m\]"
COLOR_GRAY="\[\033[32;1m\]"
COLOR_NEUTRAL="\[\033[m\]"
COLOR_RED="\[\033[0;31m\]"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# add user
PS1="$COLOR_GREEN\u$COLOR_NEUTRAL@"
# add host
PS1+="${COLOR_YELLOW}happy:"
# add current directory
PS1+="$COLOR_BLUE\w"
# git branch
PS1+="$COLOR_GRAY\$(parse_git_branch)"
# git changes color
PS1+=""
# command prompot
PS1+="\n $COLOR_GRAY -\$ $COLOR_NEUTRAL"

export PS1

# shorterns path; requires Bash Version > 4.0 
export PROMPT_DIRTRIM=3

#adds directory to title bar of iterm
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"';
fi


#===========================PREVIEW MARKDOWN===============================
# uses Pandoc and styles in github_md.css 
# alias preview_md="pandoc -o md_preview.html --from markdown_github --to html -c ~/dotfiles/github_md.css README.md && open md_preview.html && sleep 2 && rm -f md_preview.html"

preview_md() {
    # $1 is argument specifying file to preview
    pandoc -o md_preview.html --from markdown_github --to html -c ~/dotfiles/github_md.css $1 && open md_preview.html && sleep 2 && rm -f md_preview.html
}


#===========================COMPLETION===============================
# git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
    fi

# inspired by http://mrzool.cc/writing/sensible-bash/
bind "set completion-ignore-case on" # ignore case in completion
bind "set completion-map-case on" # hyphens and underscores equivalent in completion
bind "set show-all-if-ambiguous on" # show results con first <Tab>

# Avoid duplicate entries in history
HISTCONTROL="erasedups:ignoreboth"

# Save multi-line commands as one command
shopt -s cmdhist

#===========================OTHER===============================
# Homebrew installs applications in usr/local/bin
	#tell OS to use programs in this directory
export PATH=/usr/local/bin:$PATH

# virtual environment wrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh


