alias g="git status"
alias gd="git diff"
alias gcb="git checkout -b"
alias gb="git branch"
alias grc="git rebase --continue"
alias gc="git commit"
alias gca="git commit -v -a"
alias gl="git log --oneline"

# remove zsh git plugin gco and use our own
unalias gco 2>/dev/null

function gco() {
  echo "running gco func"
  if [ $# -eq 0 ]
  then
    # search for a branch w/ fuzzy finder and then check it out
    git branch | fzf | xargs git checkout
  else
    # pass the args to git checkout
    git checkout $*
  fi
}

# commit pending changes and quote the rest of the command
# as the comment
unalias gg 2>/dev/null # remove git-gui shortcut

function gg() {
  git commit -v -a -m "$*"
}

