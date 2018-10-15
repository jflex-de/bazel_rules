# Skylark rule for JFlex

## Attributes

* **name** (Name; required)
  Unique name for this target.
* **srcs** (List of labels; required)
  List of flex specifications.
* **outputs** (list of labels; required)
  List of the generated java files.
* **skeleton** (Label; optional)
  Skeleton use by the JFlex Emitter. **Only use this option if you know what you are doing.**
  

## Example

The example **//java/jflex/examples/helloworld** generates a lexer from `helloworld.flex` with:
 
     jflex(
        name = "gen_hello_lexer",
        srcs = ["helloworld.flex"],
        outputs = ["HelloWorld.java"],
    )

See [//java/jflex/examples/helloworld](../java/jflex/examples/helloworld).
