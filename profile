# Reload with `. .profile`
# ------------------------

# Custom prompt
export PS1="\[\e]2;\u@\H:\W\a\[\e[0;30;1m\]\w\[\e[0m\]\n$ \H \[\e[31;1m\]| \[\e[0m\]"

# Colored grep
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'

# Vim/Emacs key syntax for bash
# set -o vi
set -o emacs

# Custom aliases
alias q='exit'
alias ll='ls -la'
alias rd='rm -rdf'

# Git aliases
alias s="git s"
alias l="git l"
alias b="git branch"
alias giff="git diff"
alias gadd="git add"

alias pick="git cherry-pick"
alias m="git checkout master"
alias d="git checkout deploy"
alias f="git checkout fixes"

alias dep="git checkout deploy && git rebase master && git pull origin deploy && git checkout master && git rebase deploy && git push"

# Git aliasy (inspired by Pepe Calvera)
alias gico="git commit"
alias gica="git commit -a"
alias gita="git tag"
alias gist="git status"

alias gips="git push"
alias gipl="git pull"
alias girm="git rm"
alias gimv="git mv"
alias gife="git fetch"
alias gibra="git branch -r"

# Mercurial
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# Add color and default options to grep
alias grep='GREP_OPTIONS="--color=auto --ignore-case --line-number --context=0 --exclude=*.log" GREP_COLOR="1;37;41" LANG=C grep'

# Open new shells in most recently visited dir (http://gist.github.com/132456)
pathed_cd () {
    if [ "$1" == "" ]; then
        cd
    else
        cd "$1"
    fi
    pwd > ~/.cdpath
}
alias cd="pathed_cd"
 
if [ -f ~/.cdpath ]; then
  cd $(cat ~/.cdpath)
fi
