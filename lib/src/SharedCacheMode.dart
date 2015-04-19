//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache for the persistence unit. */
class SharedCacheMode extends Enum {
  static const SharedCacheMode ALL = const SharedCacheMode("ALL");
  static const SharedCacheMode DISABLE_SELECTIVE = const SharedCacheMode("DISABLE_SELECTIVE");
  static const SharedCacheMode ENABLE_SELECTIVE = const SharedCacheMode("ENABLE_SELECTIVE");
  static const SharedCacheMode NONE = const SharedCacheMode("NONE");
  static const SharedCacheMode UNSPECIFIED = const SharedCacheMode("UNSPECIFIED");

  const SharedCacheMode(String name) : super(name);
}
