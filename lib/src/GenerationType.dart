//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  03:21:45 PM
// Author: hernichen

/** Defines the types for primary key generation strategies. */
class GenerationType extends Enum {
  static const GenerationType AUTO = const GenerationType("AUTO", 0);
  static const GenerationType IDENTITY = const GenerationType("IDENTITY", 1);
  static const GenerationType SEQUENCE = const GenerationType("SEQUENCE", 2);
  static const GenerationType TABLE = const GenerationType("TABLE", 3);

  const GenerationType(String name, int ordinal) : super(name, ordinal);
}
