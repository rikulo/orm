//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** Specifies whether a transaction-scoped or extended persistence context is
 * used in PersistenceContext.
 */
class PersistenceContextType extends Enum {
  static const PersistenceContextType EXTENDED = const PersistenceContextType("EXTENDED", 0);
  static const PersistenceContextType TRANSACTION = const PersistenceContextType("TRANSACTION", 1);

  const PersistenceContextType(String name, int ordinal) : super(name, ordinal);
}
