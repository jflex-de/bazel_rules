# Use of the data attribute for nested grammars
load("//jflex:jflex.bzl", "jflex")

jflex(
    name = "gen_nested_grammar",
    srcs = ["nested_grammar.jflex"],
    data = ["extra-jflex-rules.inc.jflex"],
    outputs = ["NestedRulesScanner.java"],
)

java_library(
    name = "nested_grammar",
    srcs = [
        "Token.java",
        ":gen_nested_grammar",
    ],
    visibility = ["//javatests/jflex/examples/nested_grammar:__pkg__"],
    deps = [],
)
