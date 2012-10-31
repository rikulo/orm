//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:13:55 PM
// Author: hernichen

/** Specifies [EntityManager]s created by the [EntityManagerFactory] is
 * a JTA or resource-local entity managers.
 */
class PersistenceUnitTransactionType extends Enum {
  const PersistenceUnitTransactionType(String name, int ordinal)
      : super(name, ordinal);
}
