package jflex.examples.jacc_calculator;

/** Multiplication. */
class MulExpr extends BinExpr {

  MulExpr(Expr left, Expr right) {
    super(left, right);
  }

  int eval() {
    return left.eval() * right.eval();
  }
}
