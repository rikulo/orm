//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:25:13 PM
// Author: hernichen

/** Called by [Persistence] class or container to create an
 * [EntityManagerFactory].
 */
interface PersistenceProvider {
  /** Called by container to create an [EntityManagerFactory].
   * + [info] - metadata used by the persistence provider.
   * + [properties] - properties for integration used by persistence provider.
   */
  Future<EntityManagerFactory> createContainerEntityManagerFactory(
      PersistenceUnitInfo info, Map properties);

  /** Called by [Persistence] class to create an [EntityManagerFactory].
   * + [name] - name of the persistence unit
   * + [properties] - properties used by persistence provider.
   */
  Future<EntityManagerFactory> createEntityManagerFactory(
      [String name, Map properties]);

  /** Returns the utility class by this persistence provider */
  ProviderUtil getProviderUtil();
}
