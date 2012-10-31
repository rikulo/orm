//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

/** How the EntityManager handle 2nd-level cache when read from
 * database(by find or queries).
 */
class CacheRetrieveMode extends Enum {
  static final CacheRetrieveMode BYPASS = const CacheRetrieveMode("BYPASS", 0);
  static final CacheRetrieveMode USE = const CacheRetrieveMode("USE", 1);

  const CacheRetrieveMode(String name, int ordinal) : super(name, ordinal);
}
