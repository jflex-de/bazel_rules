# Copyright (C) 2018 Google LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    https://www.apache.org/licenses/LICENSE-2.0
""" Skylark rules for CUP. """

def _cup_impl(ctx):
    """ Generates a Java parser from a CUP definition, using Java CUP. """

    # Output directory is bazel-genfiles/package, regardless of Java package defined in
    # the grammar
    output_dir = "/".join(
        [ctx.configuration.genfiles_dir.path, ctx.label.package],
    )
    args = []
    args.extend(["-parser", ctx.attr.parser])
    args.extend(["-symbols", ctx.attr.symbols])
    args.extend(["-destdir", output_dir])
    if ctx.attr.interface:
        args.append("-interface")
    args.extend([ctx.file.src.path])

    # TODO(regisd): Add support for CUP options.
    print("cup " + (" ".join(args)))
    parser_file = ctx.actions.declare_file(ctx.attr.parser + ".java")
    sym_file = ctx.actions.declare_file(ctx.attr.symbols + ".java")
    ctx.actions.run(
        mnemonic = "cup",
        inputs = [ctx.file.src],
        outputs = [parser_file, sym_file],
        executable = ctx.executable.cup_bin,
        arguments = args,
    )
    return [DefaultInfo(
        files = depset([parser_file, sym_file]),
    )]

cup = rule(
    implementation = _cup_impl,
    attrs = {
        "src": attr.label(
            allow_files = True,
            single_file = True,
            mandatory = True,
            doc = "The CUP grammar specification",
        ),
        "cup_bin": attr.label(
            default = Label("//third_party/cup:cup_bin"),
            executable = True,
            cfg = "host",
            doc = "The java_binary of CUP",
        ),
        "parser": attr.string(
            default = "parser",
            doc = "Name of the generated parser class",
        ),
        "symbols": attr.string(
            default = "sym",
            doc = "Name of the generated symbols class",
        ),
        "interface": attr.bool(
            doc = "Outputs the symbol constant code as an interface rather than as a class.",
        ),
    },
    output_to_genfiles = True,  # JFlex generates java files, not bin files
)
