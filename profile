# ======================================
# Bash profile, reload with `. .profile`
# ======================================

# Custom prompt
# -------------
export PS1="\[\e]2;\u@\H:\W\a\[\e[0;30;1m\]\w\[\e[0m\]\n$ \H \[\e[31;1m\]| \[\e[0m\]"

# Vim/Emacs key syntax for bash
# -----------------------------
# set -o vi
set -o emacs

# Custom aliases
# --------------
alias q='exit'
alias ll='ls -lah'
alias rd='rm -rdf'

# Git aliases
# -----------
alias s="git s"
alias l="git l"
alias b="git branch"
alias giff="git diff"

alias pick="git cherry-pick"
alias m="git checkout master"
alias d="git checkout deploy"
alias f="git checkout fixes"

# Add color and default options to grep
# -------------------------------------
alias grep='GREP_OPTIONS="--color=auto --ignore-case --line-number --context=0 --exclude=*.log" GREP_COLOR="1;37;41" LANG=C grep'

# Tricks
# ------
# Open new shells in most recently visited dir (http://gist.github.com/132456)
#
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
#
