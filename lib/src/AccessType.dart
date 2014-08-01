//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache when read from
 * database(by find or queries).
 */
class AccessType extends Enum {
  static const AccessType FIELD = const AccessType("FIELD", 0);
  static const AccessType PROPERTY = const AccessType("PROPERTY", 1);

  const AccessType(String name, int ordinal) : super(name, ordinal);
}
