//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:46:34 PM
// Author: hernichen

/** Represent a join-fetched association.
 *   + [Z] - the source type of the fetch.
 *   + [X] - the target type of the fetch.
 */
abstract class Fetch<Z,X> extends FetchParent<Z,X> {
  /** Returns the metamodel attribute corresponding to the fetch join. */
  Attribute<Z, dynamic> getAttribute();

  /** Returns the join type used in the fetch join */
  JoinType getJoinType();

  /** Returns the parent of the fetched item. */
  FetchParent<dynamic, Z> getParent();
}
