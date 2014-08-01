part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:46:44 PM
// Author: hernichen

/** Collection type. */
class CollectionType extends Enum {
  static const CollectionType COLLECTION = const CollectionType("COLLECTION", 0);
  static const CollectionType LIST = const CollectionType("LIST", 1);
  static const CollectionType MAP = const CollectionType("MAP", 2);
  static const CollectionType SET = const CollectionType("SET", 3);
  static const CollectionType QUEUE = const CollectionType("QUEUE", 4);

  const CollectionType(String name, int ordinal) : super(name, ordinal);
}
