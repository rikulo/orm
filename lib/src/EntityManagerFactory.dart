//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:13:37 PM
// Author: hernichen

/** EntityManger factory for the persistence unit. */
interface EntityManagerFactory {
  /** Create an EntityManager with optional [properties]. A new
   * EntityManager is created each time this method is called.
   * + [properties] - optional properties.
   */
  EntityManager createEntityManager([Map properties]);

  /** Whether this factory is open */
  bool isOpen();

  /** Close the factory and release all resources it holds */
  void close();

  /** Returns the properties and associated values that are in effect for this
   * [EntityMangerFactory].
   */
  Map<String, dynamic> getProperties();

  /** Returns an instance of [CriteriaBuilder] for the creation of the
   * [CriteriaQuery] objects.
   */
  CriteriaBuilder getCriteriaBuilder();

  /** Returns an instance of [Metamodel] for access to the metamodel of the
   * persitence unit.
   */
  Metamodel getMetamodel();

  /** Returns the helping utility for the persistence unit. */
  PersistenceUnitUtil getPersistenceUnitUtil();

  /** Returns the cache that is associated with this [entityMangerFactory] */
  Cache getCache();
}
