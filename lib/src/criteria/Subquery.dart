//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  07:19:34 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Defines functions that work with subqueries.
 *  + [T] - the type of the selection item.
 */
abstract class Subquery<T> implements AbstractQuery<T>, Expression<T> {
  /** Create a subquery collection join correlated to a collection join of
   * the parent query
   */
  CollectionJoin correlateCollection(CollectionJoin parentCollection);

  /** Create a subquery join correlated to a join of the parent query */
  Join correlate(Join parentJoin);

  /** Create a subquery list join correlated to a list join of the parent
   * query
   */
  ListJoin correlateList(ListJoin parentJoin);

  /** Create a subquery map join correlated to a map join of the parent query */
  MapJoin correlateMap(MapJoin parentMap);

  /** Create a subquery root correlated to a root of the parent query */
  Root correlateRoot(Root parentRoot);

  /** Create a subquery set join correlated to a set join of the parent query */
  SetJoin correlateSet(SetJoin parentSet);

  /** Return the correlated joins of the subquery */
  Set<Join> getCorrelatedJoins();

  /** Returns the parent query of this subquery */
  AbstractQuery getParent();

  /** Returns selection expression */
  Expression<T> getSelection();

  /** Specifies item that is to be returned as the subquery result */
  Subquery<T> select(Expression<T> expression);
}
