package(default_visibility = ["//javatests/jflex/examples/custom_bin:__pkg__"])

load("//jflex:jflex.bzl", "jflex")
load("//cup:cup.bzl", "cup")

jflex(
    name = "gen_lexer",
    srcs = ["specification.flex"],
    jflex_bin = "//jflex/testing:fake_jflex_bin",
    outputs = ["Empty.java"],
)

cup(
    name = "gen_parser",
    src = "grammar.cup",
    cup_bin = "//cup/testing:fake_cup_bin",
    parser = "MyParser",
    symbols = "MySymbols",
)
