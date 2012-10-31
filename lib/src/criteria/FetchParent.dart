//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:38:34 PM
// Author: hernichen

/** Base class for fetching from an object.
 *   + [Z] - the source type.
 *   + [X] - the target type.
 */
abstract class FetchParent<Z,X> {
  /** Create a fetch join to the specified colleciton-valued attribute with the
   * specified optional [JoinType]; default to inner join.
   */
  Fetch<X,dynamic> fetchPlural(
      PluralAttribute<X,dynamic,dynamic> attribute,
      [JoinType joinType = JoinType.INNER]);

  /** Create a fetch join to the specified single-valued attribute with the
   * specified optional [JoinType]; default to inner join.
   */
  Fetch<X,dynamic> fetchSingular(
      SingularAttribute<X,dynamic> attribute,
      [JoinType joinType = JoinType.INNER]);


  /** Create a fetch join to the named attribute with the
   * specified optional [JoinType]; default to inner join.
   */
  Fetch<X,dynamic> fetchByName(String attributeName,
                        [JoinType joinType = JoinType.INNER]);

  /** Returns the fetch joins made from this FetchParent */
  Set<Fetch<X,dynamic>> getFetches();
}
