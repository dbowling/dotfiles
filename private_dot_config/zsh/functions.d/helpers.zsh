#!/usr/bin/env zsh
# test-func
#
# Sources chezmoi copy of function then executes it. Useful for testing
# without having to apply the function, or manually sourcing it each time.
#
# accepts two arguments
# @arg1     name of function, must match file name   required
# @arg2     args of functions                        optional
test-func() {
echo "🧪 Sourcing $(chezmoi source-path)/private_dot_config/zsh/functions.d/$1.zsh"
source $(chezmoi source-path)/private_dot_config/zsh/functions.d/$1.zsh

echo "🧪 Executing $1 $2"
$1 $2

echo "🧪 Done"
}