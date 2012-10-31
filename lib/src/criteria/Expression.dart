//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:08:27 PM
// Author: hernichen

/** Base query expression.
 *  + [T] - the type of this expression.
 */
abstract class Expression<T> extends Selection<T> {
  //meaningless in dart
  //Expression as(DartType type);

  /** Create a predicate to test wheather this expression is a member in the
   * collection.
   */
  Predicate inCollection(Collection values);

  /** Create a predicate to test wheather this expression is a member in the
   * expression list.
   */
  Predicate inExpression(List<Expression> expressions);

  /** Create a predicate to test wheather this expression is a member in the
   * collection returned by the specified collection expression.
   */
  Predicate inCollectionExpression(Expression<Collection> values);

  /** Create a predicate to test whether the expression is not null */
  Predicate isNotNull();

  /** Create a predicate to test whether the expression is null */
  Predicate isNull();
}
