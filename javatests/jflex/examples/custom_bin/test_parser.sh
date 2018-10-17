#!/bin/sh
set -e
actual_parser=$1
actual_sym=$2
set -x
diff javatests/jflex/examples/custom_bin/expected_parser.java ${actual_parser}
diff javatests/jflex/examples/custom_bin/expected_sym.java ${actual_sym}
