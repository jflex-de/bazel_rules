# Skylark rule for Java CUP


## Attributes

* **name** (Name; required)
  Unique name for this target.
* **src** (Label; required)
  The CUP specification.
* **parser** (String; optional)
  The class name of the parser to generate. Defaults to `parser`, hence generating `parser.java`.
  Note that the lower case is used to behave like the CUP program.
* **symbols** (String; optional)
  The class name of the symbols holder. Defaults to `sym`, hence generating `sym.java`.
  Note that the lower case is used to behave like the CUP program.

## Example

The example **//java/jflex/examples/helloworld** generates a lexer from `helloworld.flex` with:
 
    cup(
        name = "gen_parser",
        src = "calculator.cup",
        parser = "CalculatorParser",
        symbols = "Calc",
    )

See [//java/jflex/examples/helloworld](../java/jflex/examples/calculator).
