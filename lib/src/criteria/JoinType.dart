//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:34:10 PM
// Author: hernichen

/** Defines the join types */
class JoinType extends Enum {
  static const JoinType INNER = const JoinType("INNER", 0);
  static const JoinType LEFT = const JoinType("LEFT", 1);
  static const JoinType RIGHT = const JoinType("RIGHT", 2);

  const JoinType(String name, int ordinal) : super(name, ordinal);
}
