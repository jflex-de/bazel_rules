package jflex.examples.jacc_calculator;

/** Addition. */
class AddExpr extends BinExpr {

  AddExpr(Expr left, Expr right) {
    super(left, right);
  }

  int eval() {
    return left.eval() + right.eval();
  }
}
