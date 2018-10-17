#!/bin/sh
set -e
actual=$1

expected=javatests/jflex/examples/custom_bin/expected_lexer.java

set -x
diff "${expected}" "$(pwd)/${actual}"
