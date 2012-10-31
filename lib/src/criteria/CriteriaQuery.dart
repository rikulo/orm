//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 14, 2012  11:01:14 AM
// Author: hernichen

/** Query functionalities in entity level specified for top-level query
 *   + [T] - the type of the query result.
 */
abstract class CriteriaQuery<T> extends AbstractQuery<T> {
  /** Returns the ordering expressions in order of precedence */
  List<Order> getOrderList();

  /** Returns the parameters of the query */
  Set<ParameterExpression> getParameters();

  /** Specifies the selection items taht are to be returned in the query result */
  CriteriaQuery<T> multiselect(List<Selection> selectionList);

  /** Specifies the ordering expressions */
  CriteriaQuery<T> orderBy(List<Order> orders);

  /** Specifies the selection of this query */
  CriteriaQuery<T> select(Selection selection);
}
