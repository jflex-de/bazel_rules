package jflex.examples.jacc_calculator;

/** A binary expression. */
abstract class BinExpr extends Expr {

  protected Expr left, right;

  BinExpr(Expr left, Expr right) {
    this.left = left;
    this.right = right;
  }
}
