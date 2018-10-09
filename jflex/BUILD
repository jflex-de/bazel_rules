package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # BSD

java_binary(
    name = "jflex_bin",
    main_class = "jflex.Main",
    runtime_deps = [
        ":jflex",
        ":cup_runtime",
    ],
)

# Alias to latest version
alias(
    name = "jflex",
    actual = ":jflex_1_7_0",
)

alias(
    name = "cup_runtime",
    actual = "cup_runtime_11b",
)

java_library(
    name = "jflex_1_7_0",
    # Only the latest version should be used
    visibility = ["//visibility:private"],
    # @de_jflex_jflex_1_6_1 points to the reference in the WORKSPACE
    exports = ["@de_jflex_jflex_1_7_0//jar"],
)

java_library(
    name = "cup_runtime_11b",
    exports = ["@de_jflex_cup_runtime_11b//jar"],
    visibility = ["//visibility:private"],
)
