//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:34:10 PM
// Author: hernichen

/** An entity in From clause; or embeddable belong to an entity
 * + [Z] - the source type.
 * + [X] - the target type.
 */
abstract class From<Z,X> implements QueryPath<X>, FetchParent<Z,X> {
  /** Returns the parent [From] object from which the correlated [From] object
   * is obtained through correlation(see [Subquery].correlate).
   */
  From<Z,X> getCorrelationParent();

  /** Returns the joins that have been made from this [From]. */
  Set<Join<X, dynamic>> getJoins();

  /** Returns whether this [From] object is obtained from correlation(see
   * [Subquery].correlate method)
   */
  bool isCorrelated();

  /** Create a join to the specified Collection-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  CollectionJoin<X,dynamic> joinCollection(
      CollectionAttribute<X,dynamic> collection,
      [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified List-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  ListJoin<X,dynamic> joinList(
      ListAttribute<X,dynamic> list, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified Set-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  SetJoin<X,dynamic> joinSet(
      SetAttribute<X,dynamic> setvalues, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified Map-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  MapJoin<X,dynamic,dynamic> joinMap(
      MapAttribute<X,dynamic,dynamic> map,
      [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified single-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  Join<X,dynamic> join(SingularAttribute<X,dynamic> attribute,
                     [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified Collection-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  CollectionJoin<X,dynamic> joinCollectionByName(
      String attributeName, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified List-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  ListJoin<X,dynamic> joinListByName(
      String attributeName, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified Set-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  SetJoin<X,dynamic> joinSetByName(
      String attributeName, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified Map-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  MapJoin<X,dynamic,dynamic> joinMapByName(
      String attributeName, [JoinType joinType = JoinType.INNER]);

  /** Create a join to the specified single-valued attribute using
   * the optional [JoinType]; default to inner join.
   */
  Join<X,dynamic> joinByName(
      String attributeName, [JoinType joinType = JoinType.INNER]);
}
