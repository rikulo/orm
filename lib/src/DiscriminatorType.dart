//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  11:05:06 AM
// Author: hernichen

part of rikulo_orm;

/** Used to ditinguish the type of the [DiscriminatorColumn]. */
class DiscriminatorType extends Enum {
  static const DiscriminatorType CHAR = const DiscriminatorType("CHAR");
  static const DiscriminatorType INTEGER = const DiscriminatorType("INTEGER");
  static const DiscriminatorType STRING = const DiscriminatorType("STRING");

  const DiscriminatorType(String name) : super(name);
}
