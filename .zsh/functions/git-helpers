alias g="git status"
alias gd="git diff"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias grc="git rebase --continue"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gl="git log --oneline"

# Commit pending changes and quote the rest of the command as the message
unalias gg # this comes from the git plugin (for git gui, and I don't want it)
function gg() {
  git commit -v -a -m "$*"
}

# Fetch gitignore from gitignore.io. Usage:
# gi xcode
function gi() {
  curl https://www.gitignore.io/api/$1
}
