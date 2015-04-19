part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:44:35 PM
// Author: hernichen

/** Persistence type. */
class PersistentAttributeType extends Enum {
  static const PersistentAttributeType BASIC = const PersistentAttributeType("BASIC");
  static const PersistentAttributeType ELEMENT_COLLECTION = const PersistentAttributeType("ELEMENT_COLLECTION");
  static const PersistentAttributeType EMBEDDED = const PersistentAttributeType("EMBEDDED");
  static const PersistentAttributeType MANY_TO_MANY = const PersistentAttributeType("MANY_TO_MANY");
  static const PersistentAttributeType MANY_TO_ONE = const PersistentAttributeType("MANY_TO_ONE");
  static const PersistentAttributeType ONE_TO_MANY = const PersistentAttributeType("ONE_TO_MANY");
  static const PersistentAttributeType ONE_TO_ONE = const PersistentAttributeType("ONE_TO_ONE");

  const PersistentAttributeType(String name) : super(name);
}
