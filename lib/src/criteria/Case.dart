//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  04:40:39 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Used to build general `case` expression.
 *  + [R] - the type of this case expression.
 */
abstract class Case<R> extends Expression<R> {
  /** Add an `else` clause to the `case` expression. */
  Expression<R> otherwise(Expression<R> result);

  /** Add an `when/then` clause to the `case` expression. */
  when(Expression<bool> condition, Expression<R> result);
}
