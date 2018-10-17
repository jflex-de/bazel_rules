load("//jflex:jflex.bzl", "jflex")
load("//cup:cup.bzl", "cup")

jflex(
    name = "gen_lexer",
    srcs = ["specification.flex"],
    jflex_bin = ":fake_jflex",
    outputs = ["Empty.java"],
)

cup(
    name = "gen_parser",
    src = "grammar.cup",
    cup_bin = ":fake_cup",
    parser = "MyParser",
    symbols = "MySymbols",
)

sh_binary(
    name = "fake_jflex",
    srcs = ["fake_jflex.sh"],
)

sh_binary(
    name = "fake_cup",
    srcs = ["fake_cup.sh"],
)
