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
