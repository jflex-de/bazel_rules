# Bazel rules for JFlex & Cup

This repository offers two rules for projects using the [Bazel build system][bazel]:

- Rule to generate java source files from a lexer specification, with [JFlex][gh-jflex]

- Rule to generate java source files from a parser specification, with [CUP][cup]

## Project health

Status of the **master** branch:
<a href="https://cirrus-ci.com/github/jflex-de/bazel_rules">
<img src="https://api.cirrus-ci.com/github/jflex-de/bazel_rules.svg" alt="Build status" height="20">
</a>


## Disclaimer

This is not an officially supported Google product.

## Prepare your Bazel workspace

### Add a dependency on rules_jvm_external

See [bazelbuild/rules_jvm_external][bb_jvm_external].

### Load the jflex rule

Load the **bazel_rules** in your [`WORKSPACE` file][be_workspace]
and add `JFLEX_ARTIFACTS` in your `maven_install` rule:

    load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
    load("@rules_jvm_external//:defs.bzl", "maven_install")

    http_archive(
        name = "jflex_rules",
        sha256 = "c4d68bde12f47af86b6f80a34dd55c67e82cf77b7ff2317cb472c07b1d09a6da",
        strip_prefix = "bazel_rules-1.9.1",
        url = "https://github.com/jflex-de/bazel_rules/archive/v1.9.1.tar.gz",
    )

    load("@jflex_rules//jflex:deps.bzl", "JFLEX_ARTIFACTS")

    maven_install(
        name = "maven",
        artifacts = JFLEX_ARTIFACTS,
        maven_install_json = "//:maven_install.json",
        repositories = [
            "https://jcenter.bintray.com/",
            "https://maven.google.com",
            "https://repo1.maven.org/maven2",
        ],
    )

If this is the first time you use `maven_install`, you need to generate the `maven_install.json` with

    bazel run @maven//:pin

If you already used `maven_install` before, you need to update the pinned artifacts with:

    bazel run @unpinned_maven//:pin

## Usage in BUILD files

    load("@jflex_rules//jflex:jflex.bzl", "jflex")
    load("@jflex_rules//cup:cup.bzl", "cup")

    jflex(
        name = "",           # Choose a rule name
        srcs = [],           # A list of flex specifications
        outputs = [],        # List of expected generated files
    )

    cup(
        name = "",           # Choose a rule name
        src = "",            # Grammar specification
    )

As usual, these rules can be used as one of the `srcs` of another rules, such as a `java_library`.

For more details, see [cup](cup) and [jflex](jflex).

## Directory layout

    ├── assets                 → assets for the web site
    ├── cup                    → contains the `cup.bzl` Skylark extension
    ├── java                   → main Java source code
    │   └── jflex
    │       └── examples       → examples
    │           ├── calculator → integration of JFlex and CUP
    │           └── helloworld → simple lexer
    ├── javatests              → tests of the examples
    ├── jflex                  → contains the `jflex.bzl` Skylark extension
    └── third_party            → Aliases for third-party libraries


[bazel]: http://bazel.build/
[gh-jflex]: https://github.com/jflex-de/jflex
[cup]: http://www2.cs.tum.edu/projects/cup/
[be_workspace]: https://docs.bazel.build/versions/master/tutorial/java.html#set-up-the-workspace
[bb_jvm_external]: https://github.com/bazelbuild/rules_jvm_external
