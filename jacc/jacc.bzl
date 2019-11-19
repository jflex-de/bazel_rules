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

    jacc_spec = ctx.actions.declare_file(
        ctx.configuration.genfiles_dir.path + "/" + ctx.file.src.basename,
    )
    print("jacc in genfiles: " + str(jacc_spec))
    ctx.actions.run_shell(
        inputs = [ctx.file.src],
        outputs = [jacc_spec],
        command = "cp '{source}' .".format(
            source = ctx.file.src.path,
            pkg = ctx.file.src.dirname,
            gendir = ctx.configuration.genfiles_dir.path,
        ),
    )

    args = []

    # TODO(regisd): Add support for jacc options.
    args.extend([ctx.file.src.path])
    print("Generating in "+str(ctx.file.src.path))
    ctx.actions.run(
        mnemonic = "jacc",
        inputs = [jacc_spec],
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
