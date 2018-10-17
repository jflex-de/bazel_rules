#!/bin/sh
set -e
actual=$1
expected=javatests/jflex/examples/custom_bin/expected_lexer.java


tree $(dirname $2)


echo "diff expected: ${expected} actual: ${actual}"
diff "${expected}" "$(pwd)/${actual}"
