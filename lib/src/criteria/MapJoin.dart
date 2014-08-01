//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  07:01:14 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Collection joins to [Map] class.
 *  + [Z] - the source type of the join.
 *  + [K] - the type of the target Map key.
 *  + [V] - the type of the target Map value.
 */
abstract class MapJoin<Z,K,V> extends PluralJoin<Z,Map<K,V>,V> {
  /** Create an expression that corresponds to the map entry. */
  Expression<Map<K,V>> entry();

  /** Returns the metamodel represent the Map-valued attribute that
   * corresponding to this join.
   */
  MapAttribute<Z,K,V> getModel();

  /** Create a path expression that corresponding to the map key */
  QueryPath<K> key();

  /** Create a path expression that corresponding to the map value */
  QueryPath<V> value();
}
