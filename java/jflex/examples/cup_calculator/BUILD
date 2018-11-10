# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("//jflex:jflex.bzl", "jflex")
load("//cup:cup.bzl", "cup")

java_library(
    name = "cup_calculator",
    srcs = [
        ":gen_parser",
        ":gen_lexer",
    ],
    deps = [
        "//java/jflex/examples/calculator:exception",
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
