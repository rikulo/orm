//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache when store into database. */
class CacheStoreMode extends Enum {
  static const CacheStoreMode BYPASS = const CacheStoreMode("BYPASS");
  static const CacheStoreMode REFRESH = const CacheStoreMode("REFRESH");
  static const CacheStoreMode USE = const CacheStoreMode("USE");

  const CacheStoreMode(String name) : super(name);
}
