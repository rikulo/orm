//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:34:10 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** Defines the join types */
class JoinType extends Enum {
  static const JoinType INNER = const JoinType("INNER");
  static const JoinType LEFT = const JoinType("LEFT");
  static const JoinType RIGHT = const JoinType("RIGHT");

  const JoinType(String name) : super(name);
}
