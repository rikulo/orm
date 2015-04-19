//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** Denfines mapping for enumerated types. */
class EnumType extends Enum {
  static const EnumType ORDINAL = const EnumType("ORDINAL");
  static const EnumType STRING = const EnumType("STRING");

  const EnumType(String name) : super(name);
}
