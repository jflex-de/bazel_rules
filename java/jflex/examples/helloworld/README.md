# Hello World

## Generate the lexer

Simples example usage of the `jflex()` rule:

    jflex(
        name = "gen_hello_lexer",
        srcs = ["helloworld.flex"],
        outputs = ["HelloWorld.java"],
        visibility = ["//visibility:private"],
    )

Invoke this target:

    blaze build //java/jflex/examples/helloworld:gen_hello_lexer


**Tip** The Bazel commands work from any directory within the workspace.

**Expected output:**

* (`examples/`)`bazel-genfiles/java/jflex/examples/helloworld/Yylex.java`
  Java code generated from the flex file.


## Build

The output (generated Java sources) of the `jflex()` rule can be reused in other targets, for
instance as the source of a `java_library()`:

    java_library(
        name = "helloworld",
        srcs = [":gen_hello_lexer"],
    )

Generate the Java library

    blaze build //java/jflex/examples/helloworld:helloworld

**Tip:** Since ":helloworld" depends on ":gen_hello_lexer", you don't need to invoke the previous
target manually. This is true for any target.

**Tip** Since the target name is the same as the last part of the path, you can use the short form
`//java/jflex/examples/helloworld`.

**Expected output:**

* (`examples/`)`bazel-bin/java/jflex/examples/helloworld/libhelloworld.jar`
  The Java archive containing the HelloWorld class


## Run

From a `java_library()`, it's easy to build an executable with the `java_binary()` rule:

    java_binary(
        name = "helloworld_bin",
        main_class = "jflex.examples.helloworld.HelloWorld",
        runtime_deps = [":helloworld"],
    )

To build the executable:

    bazel build //java/jflex/examples/helloworld:helloworld_bin
    
To run this sample program:

    bazel run //java/jflex/examples/helloworld:helloworld_bin
    
Everything works, but the program complains that no input file was provided:

> Usage : java HelloWorld [ --encoding <name> ] <inputfile(s)>

We provide a sample input file in `javatest/flex/examples/helloworld/data/test.txt` with the
following content:

```
hello
name John Doe
hello
``` 

You can pass arguments to the program after `--`. 
Hence you can invoke:                                                                            

    bazel run //java/jflex/examples/helloworld:helloworld_bin -- /full/path/to/javatests/jflex/examples/helloworld/testdata.txt
    
You should see

> Hello World!
> Hello John Doe!

**N.B.** Relative paths don't work in `bazel run`.

Alternatively, you can use the generated artifact. From the `examples` directory:

    bazel-bin/java/jflex/examples/helloworld/helloworld_bin javatests/jflex/examples/helloworld/testdata.txt
    


## Test 

To execute the tests

    blaze test //javatests/jflex/examples/helloworld/...

In this sample, there is only one test:

- `//javatests/jflex/examples/helloworld:HelloWorldTest`

The example:

1. Creates an in-memory OutputStream
2. Redirects `System.out` to this in-memory stream
3. Calls the `main` method of the `HelloWorld` lexer
4. Compares line by line the content of the in-memory output
   with a hard-coded string that contains the expected output.
