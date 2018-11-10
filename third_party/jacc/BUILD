package(default_visibility = ["//visibility:public"])

licenses(["notice"])  # GPL

alias(
    name = "jacc",
    actual = "@jacc//:jacc",
)

java_binary(
    name = "jacc_bin",
    runtime_deps = [":jacc"],
    main_class = "jacc.CommandLine",
)
