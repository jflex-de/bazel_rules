# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("//jflex:jflex.bzl", "jflex")
load("//cup:cup.bzl", "cup")

java_library(
    name = "calculator",
    srcs = [
        "CalculatorParserException.java",
        ":gen_lexer",
        ":gen_parser",
    ],
    deps = [
        "//third_party/cup",  # the runtime would be sufficient
    ],
)

cup(
    name = "gen_parser",
    src = "calculator.cup",
    parser = "CalculatorParser",
    symbols = "Calc",
)

jflex(
    name = "gen_lexer",
    srcs = ["calculator.flex"],
    outputs = ["CalculatorLexer.java"],
)
