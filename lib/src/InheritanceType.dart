//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  03:21:45 PM
// Author: hernichen

part of rikulo_orm;

/** Defines the types of entity inheritance strategies. */
class InheritanceType extends Enum {
  static const InheritanceType JOINED = const InheritanceType("JOINED");
  static const InheritanceType SINGLE_TABLE = const InheritanceType("SINGLE_TABLE");
  static const InheritanceType TABLE_PER_CLASS = const InheritanceType("TABLE_PER_CLASS");

  const InheritanceType(String name) : super(name);
}
