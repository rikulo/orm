//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:46:34 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Collection joins to [Collection] class.
 *  + [Z] - the source type of the join.
 *  + [E] - the element type of the target [Collection].
 */
abstract class CollectionJoin<Z,E> extends PluralJoin<Z,List<E>,E> {
  /** Returns the metamodel represent the collection-valued attribute that
   * corresponding to this join.
   */
  CollectionAttribute<Z,E> getModel();
}
