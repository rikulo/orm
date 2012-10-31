//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:46:34 PM
// Author: hernichen

/** An join to an entity, embeddable, or basic type.
 * + [Z] - the source type of this [Join].
 * + [X] - the target type of the [Join].
 */
abstract class Join<Z,X> extends From<Z,X> {
  /** Returns the metamodel attribute corresponding to the join. */
  Attribute<Z,dynamic> getAttribute();

  /** Returns the join type used in the fetch join */
  JoinType getJoinType();

  /** Returns the parent of the join. */
  From<dynamic,Z> getParent();
}
