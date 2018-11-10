# Copyright (C) 2018 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
""" Skylark rules for jacc. """

def _jacc_impl(ctx):
    """ Generates a Java parser from a jacc definition, using jacc. """

    # Output directory is bazel-genfiles/package, regardless of Java package defined in
    # the grammar
    output_dir = "/".join(
        [ctx.configuration.genfiles_dir.path, ctx.label.package],
    )
    args = []
    # TODO(regisd): Add support for jacc options.
    args.extend([ctx.file.src.path])

    ctx.actions.run(
        mnemonic = "jacc",
        inputs = [ctx.file.src],
        outputs = [ctx.outputs.parser, ctx.outputs.tokens],
        executable = ctx.executable.jacc_bin,
        arguments = args,
    )

jacc = rule(
    implementation = _jacc_impl,
    attrs = {
        "src": attr.label(
            allow_files = True,
            single_file = True,
            mandatory = True,
            doc = "The jacc grammar specification",
        ),
        "jacc_bin": attr.label(
            default = Label("//third_party/jacc:jacc_bin"),
            executable = True,
            cfg = "host",
            doc = "The java_binary of jacc",
        ),
    },
    outputs = {
    "parser": "%{src}Parser.java",
    "tokens": "%{src}Tokens.java",
    },
    output_to_genfiles = True,  # jacc generates java files, not bin files
)
