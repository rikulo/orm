//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache for the persistence unit. */
class PessimisticLockScope extends Enum {
  static const PessimisticLockScope EXTENDED = const PessimisticLockScope("EXTENDED");
  static const PessimisticLockScope NORMAL = const PessimisticLockScope("NORMAL");

  const PessimisticLockScope(String name) : super(name);
}
