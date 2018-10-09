""" Skylark rules for JFlex. """

def jflex_deps():
    native.maven_jar(
        name = "de_jflex_jflex_1_7_0",
        artifact = "de.jflex:jflex:1.7.0",
        repository = "https://jcenter.bintray.com/",
    )
    
    native.maven_jar(
        name = "de_jflex_cup_runtime_11b",
        artifact = "de.jflex:cup_runtime:11b",
        repository = "https://jcenter.bintray.com/",
    )
    
    
    # Deps used by examples.
    native.maven_jar(
      name = "com_google_guava_guava_26_0_jre",
      artifact = "com.google.guava:guava:26.0-jre",
      repository = "http://jcenter.bintray.com/",
    )

def _jflex_impl(ctx):
    """ Generates a Java lexer from a lex definition, using JFlex. """

    # Output directory is bazel-genfiles/package, regardless of Java package defined in
    # the grammar
    output_dir = "/".join(
        [ctx.configuration.genfiles_dir.path, ctx.label.package],
    )

    # TODO(regisd): Add support for JFlex options.
    maybe_skel = [ctx.file.skeleton] if ctx.file.skeleton else []
    cmd_maybe_skel = ["-skel", ctx.file.skeleton.path] if ctx.file.skeleton else []
    arguments = (
        cmd_maybe_skel +
        # Option to specify output directory
        ["-d", output_dir] +
        # Input files
        [f.path for f in ctx.files.srcs]
    )
    ctx.action(
        inputs = ctx.files.srcs + maybe_skel,
        outputs = ctx.outputs.outputs,
        executable = ctx.executable._jflex,
        arguments =
            arguments,
    )
    print("Arguments " + (" ".join(arguments)))

jflex = rule(
    implementation = _jflex_impl,
    attrs = {
        "srcs": attr.label_list(
            allow_empty = False,
            allow_files = True,
            mandatory = True,
            doc = "a list of grammar specifications",
        ),
        "skeleton": attr.label(
            allow_files = True,
            single_file = True,
            doc = "an optional skeleton",
        ),
        "outputs": attr.output_list(allow_empty = False),
        "_jflex": attr.label(
            default = Label("//jflex:jflex_bin"),
            executable = True,
            cfg = "host",
        ),
    },
    output_to_genfiles = True,  # JFlex generates java files, not bin files
)
