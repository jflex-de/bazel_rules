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

Load the **bazel_rules** in your [`WORKSPACE` file][be_workspace]:

    load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

    git_repository(
            name = "jflex_rules",
            remote = "https://github.com/jflex-de/bazel_rules.git",
            branch = "stable",
    )

    load("@jflex_rules//jflex:deps.bzl", "jflex_deps")

    jflex_deps()


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
 ```
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

```


[bazel]: http://bazel.build/
[gh-jflex]: https://github.com/jflex-de/jflex
[cup]: http://www2.cs.tum.edu/projects/cup/
[be_maven_jar]: https://docs.bazel.build/versions/master/be/workspace.html#maven_jar
[be_workspace]: https://docs.bazel.build/versions/master/tutorial/java.html#set-up-the-workspace 
