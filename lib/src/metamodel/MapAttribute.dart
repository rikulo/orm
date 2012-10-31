//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  05:17:02 PM
// Author: hernichen

/** Represents dart Map-valued attributes.
 *  + [X] - the type of the represented [Map] belongs to.
 *  + [K] - the type of the key of the represented [Map].
 *  + [V] - the type of the value of the represented [Map].
 */
abstract class MapAttribute<X,K,V> extends PluralAttribute<X,Map<K,V>,V> {
  /** Returns the dart type of the Map key */
  ClassMirror getKeyDartType();

  /** Returns the type of the Map key of the represented field. */
  MetaType<K> getKeyType();
}
