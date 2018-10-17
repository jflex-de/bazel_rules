sh_test(
    name = "test_lexer",
    srcs = ["test_lexer.sh"],
    data = [":actual_lexer", "expected_lexer.java"],
    args = ["$(location :actual_lexer)"],
)

sh_test(
    name = "test_parser",
    srcs = ["test_parser.sh"],
    data = [":actual_parser", "expected_parser.java", "expected_sym.java"],
    args = ["$(locations :actual_parser)"],
)

# Workaround file not found when I use "//java/jflex/examples/custom_bin:gen_lexer" directly in the
# test.
genrule(
    name = "actual_lexer",
    # Copy the single source file in the single output file
    cmd = "cp $< $@",
    outs = ["actual_lexer.java"],
    srcs = ["//java/jflex/examples/custom_bin:gen_lexer"],
)
genrule(
    name = "actual_parser",
    # Copy all sources to the pacakge directory.
    cmd = "cp $(SRCS) $(@D)",
    outs = ["MyParser.java", "MySymbols.java"],
    srcs = ["//java/jflex/examples/custom_bin:gen_parser"],
)
