# Bazel rules for JFlex

Rules to generate java source files from a lexer specification, by [JFlex][gh-jflex],
for projects using the [Bazel build system][bazel].

This is not an officially supported Google product.

## Preparation
### Update your workspace

Load the bazel_rules in your [`WORKSPACE` file][be_workspace]:

    load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

    git_repository(
            name = "jflex_rules",
            remote = "https://github.com/jflex-de/bazel_rules.git",
            branch = "stable",
    )

    load("@jflex_rules//jflex:deps.bzl", "jflex_deps")

    jflex_deps()


## Usage

    load("@jflex_rules//jflex:jflex.bzl", "jflex")

    jflex(
        name = "",           # Choose a rule name
        srcs = [],           # Add input lex specifications
        outputs = [],        # List expected generated files
    )

Then, this rule can be used as one of the `srcs` of another rules, such as a `java_library`.



[bazel]: http://bazel.build/
[gh-jflex]: https://github.com/jflex-de/jflex
[be_maven_jar]: https://docs.bazel.build/versions/master/be/workspace.html#maven_jar
[be_workspace]: https://docs.bazel.build/versions/master/tutorial/java.html#set-up-the-workspace 
