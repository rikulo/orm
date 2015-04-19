//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  04:40:59 PM
// Author: hernichen

part of rikulo_orm;

/** Strategy when fetch referenced entities */
class FetchType extends Enum {
  static const FetchType EAGER = const FetchType("EAGER");
  static const FetchType LAZY = const FetchType("LAZY");

  const FetchType(String name) : super(name);
}
