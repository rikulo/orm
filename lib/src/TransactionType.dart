//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 29, 2012  03:08:13 PM
// Author: hernichen

part of rikulo_orm;

class TransactionType extends PersistenceUnitTransactionType {
  /** JTA entity manager will be created */
  static const TransactionType JTA =
    const PersistenceUnitTransactionType("JTA", 0);

  /** Resource-local entity manager will be created */
  static const TransactionType RESOURCE_LOCAL =
    const PersistenceUnitTransactionType("RESOURCE_LOCAL", 1);

  static const Map<String, int> _enums =
    const {"JTA" : 0, "RESOURCE_LOCAL" : 1};

  /** Returns a list of enum type, in the order of ordinal. */
  static const List<TransactionType> values =
    const [JTA, RESOURCE_LOCAL];

  /** Returns the enum constant of this type with the specified name */
  static TransactionType valueOf(String name)
    => values[_enums[name]];

  const TransactionType(String name, int ordinal)
      : super(name, ordinal);
}
