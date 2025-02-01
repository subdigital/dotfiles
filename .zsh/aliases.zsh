alias ea="$EDITOR ~/.zsh/aliases.zsh && reload"

alias vim=nvim

# Starts an HTTP Server on port 8000
alias server="open -a /Applications/Safari.app http://localhost:8000 && python -m SimpleHTTPServer 8000"

# Copy working directory to the pasteboard
alias cpdir="pwd | pbcopy"

# See disk usage in the current folder only
alias ds="du -h -d 1"

# Pretty print json (pipe some output into this alias)
alias format_json="python -m json.tool"

alias reload="source ~/.zshrc"

alias python=python3

# rg is better, but muscle memory is strong
alias ag=rg

# Open the man page as PDF in preview. Hat tip @ericasadun!
function manpdf() {
  man -t $1 | open -fa /System/Applications/Preview.app
}

if command -v gittower &> /dev/null
then
  # Open tower in the current git root
  alias tower='gittower $(git rev-parse --show-toplevel)'
fi
