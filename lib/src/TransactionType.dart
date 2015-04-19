//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 29, 2012  03:08:13 PM
// Author: hernichen

part of rikulo_orm;

class TransactionType extends Enum {
  /** JTA entity manager will be created */
  static const TransactionType JTA =
    const TransactionType("JTA");

  /** Resource-local entity manager will be created */
  static const TransactionType RESOURCE_LOCAL =
    const TransactionType("RESOURCE_LOCAL");

  /** Returns a list of enum type, in the order of ordinal. */
  static const List<TransactionType> values =
    const [JTA, RESOURCE_LOCAL];

  const TransactionType(String name)
      : super(name);
}
