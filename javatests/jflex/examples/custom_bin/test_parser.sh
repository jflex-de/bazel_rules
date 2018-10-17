#!/bin/sh
set -e
diff java/jflex/examples/custom_bin/MyParser.java javatests/jflex/examples/custom_bin/expected_parser.java
diff java/jflex/examples/custom_bin/MySymbols.java javatests/jflex/examples/custom_bin/expected_sym.java
