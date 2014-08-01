//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache for the persistence unit. */
class SharedCacheMode extends Enum {
  static const SharedCacheMode ALL = const SharedCacheMode("ALL", 0);
  static const SharedCacheMode DISABLE_SELECTIVE = const SharedCacheMode("DISABLE_SELECTIVE", 1);
  static const SharedCacheMode ENABLE_SELECTIVE = const SharedCacheMode("ENABLE_SELECTIVE", 2);
  static const SharedCacheMode NONE = const SharedCacheMode("NONE", 3);
  static const SharedCacheMode UNSPECIFIED = const SharedCacheMode("UNSPECIFIED", 4);

  const SharedCacheMode(String name, int ordinal) : super(name, ordinal);
}
