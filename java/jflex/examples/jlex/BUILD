# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

load(":caseless.bzl", "caseless_scanner")

caseless_scanner(
    name = "CaselessJflexScanner",
    deps = [":token"],
)

caseless_scanner(
    name = "CaselessLexScanner",
    jlex = True,
    deps = [":token"],
)

java_library(
    name = "token",
    srcs = ["Token.java"],
)
