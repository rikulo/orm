//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:10:12 PM
// Author: hernichen

/** boolean operator on [Predicate]. */
class BooleanOperator extends Enum {
  static final BooleanOperator AND = const BooleanOperator("AND", 0);
  static final BooleanOperator OR = const BooleanOperator("OR", 1);

  const BooleanOperator(String name, int ordinal) : super(name, ordinal);
}
