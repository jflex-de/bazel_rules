# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load("//jflex:jflex.bzl", "jflex")

jflex(
    name = "gen_caseless_jflex_scanner",
    srcs = ["caseless.flex"],
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
