load("//jflex:jflex.bzl","jflex")

# The target that generates the java code from the flex specification.
# This is what the //jflex:jflex.bzl rule provides :-)
jflex(
    name = "gen_hello_lexer",
    srcs = ["helloworld.flex"],
    outputs = ["HelloWorld.java"],
)


# A Java library that other programs can depend on.
# Not very useful because it's only public method is main.
# Well, it can be used in a hava_binary. See below.
java_library(
    name = "helloworld",
    srcs = [":gen_hello_lexer"],
)


# Executable version of the lexer
java_binary(
    name = "helloworld_bin",
    main_class = "jflex.examples.helloworld.HelloWorld",
    runtime_deps = [":helloworld"]
)
