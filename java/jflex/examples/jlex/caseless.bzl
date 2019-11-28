load("//jflex:jflex.bzl", "jflex")

def _caseless_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = ctx.outputs.jflex_file,
        substitutions = {
            "{className}": ctx.attr.className,
        },
    )

"""
Generates a Caseless scanner where the class has the given name.
"""
caseless = rule(
    implementation = _caseless_impl,
    attrs = {
        "className": attr.string(mandatory = True),
        "_template": attr.label(
            default = Label("//java/jflex/examples/jlex:caseless.flex.tpl"),
            allow_single_file = True,
        ),
    },
    outputs = {"jflex_file": "%{name}.flex"},
)

def caseless_scanner(name, deps = [], jlex = False):
    spec_name = name + "_jflex_spec"
    java_source = name + "_jflex"
    caseless(
        name = spec_name,
        className = name,
    )

    jflex(
        name = java_source,
        srcs = [":" + spec_name],
        outputs = [name + ".java"],
        jlex = jlex,
    )

    native.java_library(
        name = name,
        srcs = [":" + java_source],
        deps = deps,
    )
