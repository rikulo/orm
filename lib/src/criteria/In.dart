//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  04:46:09 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Used to build `in` predicate */
abstract class In<T> extends Predicate {
  /** Returns the expression to be tested against the list of values. */
  Expression<T> getExpression();

  /** Add specified value to the list of values to be tested against. */
  In<T> value(Expression<T> value);
}
