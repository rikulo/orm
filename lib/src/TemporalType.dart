//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  07:14:21 PM
// Author: hernichen

/** Column type for Date class */
class TemporalType extends Enum {
  static const TemporalType DATE = const TemporalType("DATE", 0);
  static const TemporalType TIME = const TemporalType("TIME", 1);
  static const TemporalType TIMESTAMP = const TemporalType("TIMESTAMP", 2);

  const TemporalType(String name, int ordinal) : super(name, ordinal);
}
