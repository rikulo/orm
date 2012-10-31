//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:52:46 PM
// Author: hernichen

/** Collection joins to [List] class.
 *  + [Z] - the source type of the join.
 *  + [E] - the element type of the target List.
 */
abstract class ListJoin<Z,E> extends PluralJoin<Z,List<E>,E> {
  /** Returns the metamodel represent the List-valued attribute that
   * corresponding to this join.
   */
  ListAttribute<Z,E> getModel();

  /** Create an expression corresponding to the index of the object in the
   * referenced association or element collection.
   */
  Expression<int> index();
}
