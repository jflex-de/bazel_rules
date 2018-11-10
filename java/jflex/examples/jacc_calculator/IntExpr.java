package jflex.examples.jacc_calculator;

/** A terminal integer expression. */
class IntExpr extends Expr {

  private int value;

  IntExpr(int value) {
    this.value = value;
  }

  int eval() {
    return value;
  }
}
