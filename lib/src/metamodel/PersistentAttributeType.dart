part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:44:35 PM
// Author: hernichen

/** Persistence type. */
class PersistentAttributeType extends Enum {
  static const PersistentAttributeType BASIC = const PersistentAttributeType("BASIC", 0);
  static const PersistentAttributeType ELEMENT_COLLECTION = const PersistentAttributeType("ELEMENT_COLLECTION", 1);
  static const PersistentAttributeType EMBEDDED = const PersistentAttributeType("EMBEDDED", 2);
  static const PersistentAttributeType MANY_TO_MANY = const PersistentAttributeType("MANY_TO_MANY", 3);
  static const PersistentAttributeType MANY_TO_ONE = const PersistentAttributeType("MANY_TO_ONE", 4);
  static const PersistentAttributeType ONE_TO_MANY = const PersistentAttributeType("ONE_TO_MANY", 5);
  static const PersistentAttributeType ONE_TO_ONE = const PersistentAttributeType("ONE_TO_ONE", 6);

  const PersistentAttributeType(String name, int ordinal) : super(name, ordinal);
}
