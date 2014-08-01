part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:44:35 PM
// Author: hernichen

/** Persistence type. */
class PersistenceType extends Enum {
  static const PersistenceType BASIC = const PersistenceType("BASIC", 0);
  static const PersistenceType EMBEDDABLE = const PersistenceType("EMBEDDABLE", 1);
  static const PersistenceType ENTITY = const PersistenceType("ENTITY", 2);
  static const PersistenceType MAPPED_SUPERCLASS = const PersistenceType("MAPPED_SUPERCLASS", 3);

  const PersistenceType(String name, int ordinal) : super(name, ordinal);
}
