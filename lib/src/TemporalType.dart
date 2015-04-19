//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  07:14:21 PM
// Author: hernichen

part of rikulo_orm;

/** Column type for Date class */
class TemporalType extends Enum {
  static const TemporalType DATE = const TemporalType("DATE");
  static const TemporalType TIME = const TemporalType("TIME");
  static const TemporalType TIMESTAMP = const TemporalType("TIMESTAMP");

  const TemporalType(String name) : super(name);
}
