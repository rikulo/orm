//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:46:34 PM
// Author: hernichen

/** Base joins to all collection types.
 *  + [Z] - the source type.
 *  + [C] - the collection type.
 *  + [E] - the element type of the collection.
 */
abstract class PluralJoin<Z,C,E> extends Join<Z,E> {
  /** Returns the metamodel represent the collection-valued attribute that
   * corresponding to this join.
   */
  PluralAttribute<Z,C,E> getModel();
}
