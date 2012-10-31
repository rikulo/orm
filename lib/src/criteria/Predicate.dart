//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:10:12 PM
// Author: hernichen

/** A conjunction or disjunction of restrictions */
abstract class Predicate extends Expression<bool> {
  /** Returns the top-level conjuncts or disjuncts of the predicate. */
  List<Expression<bool>> getExpressions();

  /** Returns the boolean operator for the predicate. */
  BooleanOperator getOperator();

  /** Returns whether the predicate has been created from another predicate by
   * applying [not] method.
   */
  bool isNegated();

  /** Create a negation of the predicate */
  Predicate not();
}
