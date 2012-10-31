//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:46:44 PM
// Author: hernichen

/** Collection type. */
class CollectionType extends Enum {
  static final CollectionType COLLECTION = const CollectionType("COLLECTION", 0);
  static final CollectionType LIST = const CollectionType("LIST", 1);
  static final CollectionType MAP = const CollectionType("MAP", 2);
  static final CollectionType SET = const CollectionType("SET", 3);
  static final CollectionType QUEUE = const CollectionType("QUEUE", 4);

  const CollectionType(String name, int ordinal) : super(name, ordinal);
}
