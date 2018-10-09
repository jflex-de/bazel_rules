# Bazel rules for JFlex

Rules to generate java source files from a lexer specification, by [JFlex][gh-jflex],
for projects using the [Bazel build system][bazel].

## Preparation
### Update your workspace

Add the [`maven_jar`][be_maven_jar] rule in your [`WORKSPACE` file][be_workspace].

    load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

    maven_jar(
        name = "de_jflex_jflex_1_6_1",
        artifact = "de.jflex:jflex:1.6.1",
        # TODO() Use jcenter.bintray.com when synced with central
        repository = "https://jcenter.bintray.com/",
        sha1 = "eb4d51e1a8ea7ee96068905ddeceb9b28737c7eb",
    )

### Add a BUILD alias for JFlex

In your workspace, create `third_party/de/jflex/BUILD` with defines the
`//third_party/de/jflex:jflex_bin` target.
It should be sufficient to check out the one provided in
`jflex/jflex/examples/third_party/de/jflex/BUILD`.

**N.B.** In our case, JFlex is obviously not a third-party package.
However, we use `//third_party/de/jflex` in the examples
to make it consistent with the recommended
[directory structure for third-party dependencies][be_3p].

## Usage

    load("//third_party/de/jflex:build_rules.bzl", "jflex")
    
    jflex(
        name = "",           # Choose a rule name
        srcs = [],           # Add input lex specifications
        outputs = [],        # List expected generated files
    )

Then, this rule can be used as one of the `srcs` of another rules, such as a `java_library`.

### Example

The example "simple" generates a lexer from `simple.flex` with:

    jflex(
        name = "gen_lexer",
        srcs = ["src/main/jflex/simple.flex"],
        outputs = ["Yylex.java"],
    )

See `examples/WORKSPACE` and `examples/simple/BUILD`.


[bazel]: http://bazel.build/
[gh-jflex]: https://github.com/jflex-de/jflex
[be_maven_jar]: https://docs.bazel.build/versions/master/be/workspace.html#maven_jar
[be_workspace]: https://docs.bazel.build/versions/master/tutorial/java.html#set-up-the-workspace 
[be_3p]: https://docs.bazel.build/versions/master/best-practices.html#third-party-dependencies
