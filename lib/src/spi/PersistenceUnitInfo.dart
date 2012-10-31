//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  10:55:59 PM
// Author: hernichen

/** Informaiton of a persistence unit(database) */
interface PersistenceUnitInfo {
  /** Add a new ClassTransformer */
  //TODO
  //addTransformer(ClassTransformer transformer);

  /** Returns whether exclude those not explicitly listed classes as managed
   * classes in persistence unit root url.
   */
  //TODO
  //bool excludeUnlistedClasses();

  //TODO
  //getClassLoader();

  //TODO
  //List<String> getJarFileUrls();

  //TODO
  //DataSource getJtaDataSource();

  /** Returns names of managed classes. */
  List<String> getManagedClassNames();

  /** Returns names of class mapping files. */
  //TODO
  //List<String> getMappingFileNames();

  //TODO
  //getNewTempClassLoader();

  //TODO
  //DataSource getNonJtaDataSource();

  /** Returns the qualified class name of the persistence provider. */
  String getPersistenceProviderClassName();

  /** Returns the name of the persistence unit. */
  String getPersistenceUnitName();

  /** Returns the URI of the root of the persistence unit. */
  //TODO
  //Uri getPersistenceUnitRootUrl();

  /** Returns the schema version of the persistence.xml file */
  //TODO
  //String getPersistenceXMLSchemaVersion();

  /** Returns the associated properties */
  Map getProperties();

  /** Returns how the PersistentProvider use a 2nd-level cache for the
   * persistence unit.
   */
  SharedCacheMode getSharedCacheMode();

  /** Returns the transaction type of the [EntityManager] created by
   * [EntityManagerFactory].
   */
  PersistenceUnitTransactionType getTransactionType();

  /** Returns the validation mode used by the PersistenceProvider for the
   * persistence unit.
   */
  ValidationMode getValidationMode();
}
