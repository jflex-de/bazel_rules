sh_test(
    name = "test_lexer",
    srcs = ["test_lexer.sh"],
    data = [":actual_lexer", "expected_lexer.java"],
    args = ["$(location :actual_lexer)"]
)

sh_test(
    name = "test_parser",
    srcs = ["test_parser.sh"],
    data = ["//java/jflex/examples/custom_bin:gen_parser", "expected_parser.java", "expected_sym.java"],
)

# Workaround file not found when I use "//java/jflex/examples/custom_bin:gen_lexer" directly in the
# test.
genrule(
    name = "actual_lexer",
    cmd = "cp $< $@",
    outs = ["actual_lexer.java"],
    srcs = ["//java/jflex/examples/custom_bin:gen_lexer"]
)
