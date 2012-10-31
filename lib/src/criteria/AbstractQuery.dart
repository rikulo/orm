//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  02:41:38 PM
// Author: hernichen

/** Defines functions to top-level query and subqueryQuery execution.
 *   + [T] - teh type of the query result.
 */
abstract class AbstractQuery<T> {
  /** Specifies whether retrieve only distinct results */
  AbstractQuery<T> distinct(bool distinct);

  /** Create and add a query root correspoinding to the specified class type */
  Root fromDartType(ClassMirror type);

  /** Create and add a query root correspoinding to the specified entity type*/
  Root fromEntityType(EntityType entity);

  /** Returns a list of grouping expression */
  List<Expression> getGroupList();

  /** Returns the predicate that corresponding to the restrictions on grouping
   * items
   */
  Predicate getGroupRestriction();

  /** Returns the predicate that corresonding to WHERE clause. */
  Predicate getRestriction();

  /** Returns the result dart type of the query or subquery */
  ClassMirror getResultType();

  /** Returns the query roots */
  Set<Root> getRoots();

  /** Returns the selection of the query */
  Selection<T> getSelection();

  /** Specifies the expressions used to form groups on the query result */
  AbstractQuery<T> groupBy(List<Expression> grouping);

  /** Specifies a restriction on the groups of the query */
  AbstractQuery<T> having(Expression<bool> restriction);

  /** Specifies multiple restrictions on the groups of the query */
  AbstractQuery<T> havingRestrictions(List<Predicate> restrictions);

  /** Returns whether retrieve only distinct results */
  bool isDistinct();

  /** Create a subquery of this query
   *  + [type] is the  type of the subquery's selection item.
   */
  Subquery subquery(ClassMirror type);

  /** Modify the query to restrict the query results */
  AbstractQuery<T> where(Expression<bool> restriction);

  /** Spcecifies multiple restrictions on the query */
  AbstractQuery<T> whereRestrictions(List<Predicate> restrictions);
}
