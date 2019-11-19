# Copyright 2018 Google LLC.
# SPDX-License-Identifier: Apache-2.0

package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # Apache 2

java_binary(
    name = "jflex_bin",
    main_class = "jflex.Main",
    runtime_deps = [
        ":cup_runtime",
        ":jflex",
    ],
)

alias(
    name = "jflex",
    actual = "@maven//:de_jflex_jflex_1_7_0",
)

alias(
    name = "cup_runtime",
    actual = "@maven//:de_jflex_cup_runtime_11b",
)
