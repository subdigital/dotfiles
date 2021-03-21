source ~/.bash/sensible.bash
source ~/.bash/aliases.bash
source ~/.bash/config.bash
source ~/.bash/env.bash

export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
export PATH="/usr/local/Cellar/node/12.5.0/bin/:${PATH}"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

export PATH="$HOME/.yarn/bin:$PATH"

export COMMAND_LINE_INSTALL="true"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
