//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  04:58:43 PM
// Author: hernichen

/** Used to build simple `case` expression.
 *  + [C] - dart type of the condition to be evaluated.
 *  + [R] - expression to be tested against conditions.
 */
abstract class SimpleCase<C,R> extends Expression<R> {
  /** Return the expression to be tested against condition */
  Expression<C> getExpression();

  /** Add an `else` clause to the case expression. */
  Expression<R> otherwise(Expression<R> result);

  /** Add a `when/then` clause to the case expression. */
  SimpleCase<C,R> when(C condition, Expression<R> result);
}
