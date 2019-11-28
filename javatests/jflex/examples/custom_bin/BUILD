sh_test(
    name = "test_lexer",
    srcs = ["test_lexer.sh"],
    args = ["$(location :actual_lexer)"],
    data = [
        "expected_lexer.java",
        ":actual_lexer",
    ],
)

sh_test(
    name = "test_parser",
    srcs = ["test_parser.sh"],
    args = ["$(locations :actual_parser)"],
    data = [
        "expected_parser.java",
        "expected_sym.java",
        ":actual_parser",
    ],
)

# Workaround file not found when I use "//java/jflex/examples/custom_bin:gen_lexer" directly in the
# test.
genrule(
    name = "actual_lexer",
    srcs = ["//java/jflex/examples/custom_bin:gen_lexer"],
    outs = ["actual_lexer.java"],
    # Copy the single source file in the single output file
    cmd = "cp $< $@",
)

genrule(
    name = "actual_parser",
    srcs = ["//java/jflex/examples/custom_bin:gen_parser"],
    outs = [
        "MyParser.java",
        "MySymbols.java",
    ],
    # Copy all sources to the pacakge directory.
    cmd = "cp $(SRCS) $(@D)",
)
