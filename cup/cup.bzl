"""Bazel rules for cup. """

# CUP can only read from stdin, which Skylark rules don't support. Use a genrule for now.
def cup(name, src, parser = "parser", symbols = "sym", interface = False, cup_bin = "//third_party/cup:cup_bin"):
    """Generate a parser with CUP.

    Args:
      name: name of the rule.
      src: the cup specifications.
      parser: name of the generated parser class.
      symbols: name of the generated symbols class.
      interface: whether to generate an interface.
      cup_bin: bazel target of the CUP executable as a java_binary target.
    """
    opts = [
        "-parser",
        parser,
        "-symbols",
        symbols,
    ]
    if interface:
        opts = opts + ["-interface"]
    options = " ".join(opts)
    cup_bin_real_path = "$(location " + cup_bin + ")"
    cmd = cup_bin_real_path + " -destdir $(@D) " + options + " < $<"
    native.genrule(
        name = name,
        srcs = [src],
        tools = [cup_bin],
        outs = [parser + ".java", symbols + ".java"],
        cmd = cmd,
    )
