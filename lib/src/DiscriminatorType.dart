//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  11:05:06 AM
// Author: hernichen

part of rikulo_orm;

/** Used to ditinguish the type of the [DiscriminatorColumn]. */
class DiscriminatorType extends Enum {
  static const DiscriminatorType CHAR = const DiscriminatorType("CHAR", 0);
  static const DiscriminatorType INTEGER = const DiscriminatorType("INTEGER", 1);
  static const DiscriminatorType STRING = const DiscriminatorType("STRING", 2);

  const DiscriminatorType(String name, int ordinal) : super(name, ordinal);
}
