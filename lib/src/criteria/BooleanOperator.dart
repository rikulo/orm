//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:10:12 PM
// Author: hernichen

part of rikulo_orm_criteria;

/** boolean operator on [Predicate]. */
class BooleanOperator extends Enum {
  static const BooleanOperator AND = const BooleanOperator("AND");
  static const BooleanOperator OR = const BooleanOperator("OR");

  const BooleanOperator(String name) : super(name);
}
