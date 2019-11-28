# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("//jflex:jflex.bzl", "jflex")
load(":caseless.bzl", "caseless")

caseless(
    name = "caseless_jflex_spec",
    className = "CaselessJflexScanner",
)

jflex(
    name = "gen_caseless_jflex_scanner",
    srcs = [":caseless_jflex_spec"],
    outputs = ["CaselessJflexScanner.java"],
)

java_library(
    name = "caseless_jflex_scanner",
    srcs = [":gen_caseless_jflex_scanner"],
    deps = [":token"],
)

java_library(
    name = "token",
    srcs = ["Token.java"],
)
