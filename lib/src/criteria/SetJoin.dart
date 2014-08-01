//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:57:02 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Collection joins to [Set] class.
 *  + [Z] - the source type of the join.
 *  + [E] - the element type of the target [Set].
 */
abstract class SetJoin<Z,E> extends PluralJoin<Z,Set<E>,E> {
  /** Returns the metamodel represent the List-valued attribute that
   * corresponding to this join.
   */
  SetAttribute<Z,E> getModel();
}
