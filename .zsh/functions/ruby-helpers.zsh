function ruby_version() {
  ruby -v | cut -d '(' -f 1 | tr -d ' '
}

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Workaround for Ruby 3 issue
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

