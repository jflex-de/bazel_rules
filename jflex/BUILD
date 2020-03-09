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

java_library(
    name = "jflex",
    exports = ["@maven//:de_jflex_jflex"],
)

java_library(
    name = "cup_runtime",
    exports = ["@maven//:de_jflex_cup_runtime"],
)
