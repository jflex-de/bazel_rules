# Bazel rules for JFlex

Rules to generate java source files from a lexer specification, by [JFlex][gh-jflex],
for projects using the [Bazel build system][bazel].

Master: [![Build Status](https://api.cirrus-ci.com/github/jflex-de/bazel_rules.svg)](https://cirrus-ci.com/github/jflex-de/bazel_rules)

## Disclaimer

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

### Example

The example "jflex.examples.helloworld" generates a lexer from `helloworld.flex` with:
 
     jflex(
        name = "gen_hello_lexer",
        srcs = ["helloworld.flex"],
        outputs = ["HelloWorld.java"],
    )
 
See `java/jflex/examples/helloworld`.
 
## Directory layout
 ```
├── assets                 → assets for the web site
├── java                   → main Java source code
│   └── jflex
│       └── examples       → examples
├── javatests              → tests
├── jflex                  → contains the `jflex.bzl`
└── third_party            → Aliases for third-party libraries
    └── com
        └── google
            └── guava
```

## Simple example

#### Generate the lexer

    blaze build //java/jflex/examples/simple:gen_lexer

Expected output:

* (`examples/`)`bazel-genfiles/java/jflex/examples/simple/Yylex.java` Java code generated from the flex file.

### Build

Generate the Java library

    blaze build //simple:simple

Expected output:

* (`examples/`)`bazel-genfiles/simple/Yylex.java` Java code generated from the flex file.


#### Test 

To execute the tests

    blaze test //simple/...

To run the lexer on any file

    bazel run //simple:simple_bin -- /full/path/to/src/test/data/test.txt
    
**N.B.** Relative path doesn't work in `bazel run`.

**Rem:** The Bazel commands work from any directory in the workspace.

Alternatively, use the generated artifact. From the `examples` directory:

    bazel-bin/simple/simple_bin simple/src/test/data/test.txt
    


[bazel]: http://bazel.build/
[gh-jflex]: https://github.com/jflex-de/jflex
[be_maven_jar]: https://docs.bazel.build/versions/master/be/workspace.html#maven_jar
[be_workspace]: https://docs.bazel.build/versions/master/tutorial/java.html#set-up-the-workspace 
