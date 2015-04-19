//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  03:21:45 PM
// Author: hernichen

part of rikulo_orm;

/** Defines the types for primary key generation strategies. */
class GenerationType extends Enum {
  static const GenerationType AUTO = const GenerationType("AUTO");
  static const GenerationType IDENTITY = const GenerationType("IDENTITY");
  static const GenerationType SEQUENCE = const GenerationType("SEQUENCE");
  static const GenerationType TABLE = const GenerationType("TABLE");

  const GenerationType(String name) : super(name);
}
