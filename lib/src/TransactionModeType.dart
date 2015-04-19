//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** Transaction mode when the EntityManager starts a transaction */
class TransactionModeType extends Enum {
  static const TransactionModeType READ_ONLY
    = const TransactionModeType("READ_ONLY");
  static const TransactionModeType READ_WRITE
    = const TransactionModeType("READ_WRITE");

  static const Map<String, int> _enums =
    const {"READ_ONLY" : 0, "READ_WRITE" : 1};

  /** Returns a list of enum type, in the order of ordinal. */
  static const List<TransactionModeType> values = const [READ_ONLY, READ_WRITE];

  const TransactionModeType(String name) : super(name);
}
