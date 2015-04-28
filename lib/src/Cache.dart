//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** Handle 2nd-level cache for the persistence unit. */
abstract class Cache {
  /** Returns whether the cache contains data for the specified dart type and
   * primary key
   */
  bool contains(ClassMirror type, var primaryKey);

  /** Remove the data of the specified dart type and optional primary key */
  void evict(ClassMirror type, [var primaryKey]);

  /** Clear the cache */
  void evictAll();
}
