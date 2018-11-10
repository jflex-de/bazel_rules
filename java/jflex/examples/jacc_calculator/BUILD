# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("//jacc:jacc.bzl", "jacc")
load("//jflex:jflex.bzl", "jflex")

java_library(
    name = "expr",
    srcs = glob(["*Expr.java"]),
)

java_library(
    name = "jacc_calculator",
    srcs = [
        ":gen_lexer",
        ":gen_parser",
    ],
    deps = [
        ":expr",
        "//java/jflex/examples/calculator:exception",
    ],
)

jflex(
    name = "gen_lexer",
    srcs = ["calculator.flex"],
    outputs = ["CalculatorLexer.java"],
)

# Generates CalculatorParser.java from Calculator.jacc
jacc(
    name = "gen_parser",
    src = "Calculator.jacc",
)