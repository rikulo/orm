part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:46:44 PM
// Author: hernichen

/** Collection type. */
class CollectionType extends Enum {
  static const CollectionType COLLECTION = const CollectionType("COLLECTION");
  static const CollectionType LIST = const CollectionType("LIST");
  static const CollectionType MAP = const CollectionType("MAP");
  static const CollectionType SET = const CollectionType("SET");
  static const CollectionType QUEUE = const CollectionType("QUEUE");

  const CollectionType(String name) : super(name);
}
