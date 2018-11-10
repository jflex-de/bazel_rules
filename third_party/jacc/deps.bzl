load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

JACC_BUILD= """#Build for https://github.com/zipwith/jacc/
package(default_visibility = ["//visibility:public"])

java_library(
    name = "jacc",
    srcs = glob(["src/jacc/**"]),
    deps = [
      ":jacc_compiler",
    ]
)

java_library(
    name = "jacc_compiler",
    srcs = glob(["src/compiler/**"]),
)
"""

def jacc_deps():
    new_git_repository(
        name = "jacc",
        remote = "https://github.com/zipwith/jacc.git",
        commit = "c553c059081d4fad51f04ac1a373799daf0c80bb",
        build_file_content = JACC_BUILD,
    )
