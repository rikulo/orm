//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

/** Denfines mapping for enumerated types. */
class EnumType extends Enum {
  static const EnumType ORDINAL = const EnumType("ORDINAL", 0);
  static const EnumType STRING = const EnumType("STRING", 1);

  const EnumType(String name, int ordinal) : super(name, ordinal);
}
