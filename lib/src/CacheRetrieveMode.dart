//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache when read from
 * database(by find or queries).
 */
class CacheRetrieveMode extends Enum {
  static const CacheRetrieveMode BYPASS = const CacheRetrieveMode("BYPASS");
  static const CacheRetrieveMode USE = const CacheRetrieveMode("USE");

  const CacheRetrieveMode(String name) : super(name);
}
