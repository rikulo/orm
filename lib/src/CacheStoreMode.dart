//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

/** How the EntityManager handle 2nd-level cache when store into database. */
class CacheStoreMode extends Enum {
  static const CacheStoreMode BYPASS = const CacheStoreMode("BYPASS", 0);
  static const CacheStoreMode REFRESH = const CacheStoreMode("REFRESH", 1);
  static const CacheStoreMode USE = const CacheStoreMode("USE", 2);

  const CacheStoreMode(String name, int ordinal) : super(name, ordinal);
}
