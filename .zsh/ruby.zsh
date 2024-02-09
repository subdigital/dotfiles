export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Workaround for Ruby 3 issue
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
