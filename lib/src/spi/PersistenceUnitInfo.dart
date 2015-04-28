part of rikulo_orm_spi;
/*
 * Copyright (c) 2008, 2009, 2011 Oracle, Inc. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse License v1.0 and Eclipse Distribution License v. 1.0
 * which accompanies this distribution.  The Eclipse License is available
 * at http://www.eclipse.org/legal/epl-v10.html and the Eclipse Distribution License
 * is available at http://www.eclipse.org/org/documents/edl-v10.php.
 */
/**
 * Interface implemented by the container and used by the
 * persistence provider when creating an {@link javax.persistence.EntityManagerFactory}.
 */
class PersistenceUnitInfo {

  PersistenceUnitInfo(
      this.persistenceUnitName,
      this.transactionType,
      this.persistenceProviderClassName,
      this.managedClassNames,
      this.mappingFileNames,
      this.sharedCacheMode,
      this.validationMode,
      this.properties,
      {this.excludeUnlistedClasses,
      this.persistenceUnitRootUrl,
      this.persistenceXMLSchemaVersion});

  /**
   * Returns the name of the persistence unit. Corresponds to the
   * <code>name</code> attribute in the <code>persistence.xml<code> file.
   */
  final String persistenceUnitName;

  /**
   * Returns the fully qualified name of the persistence provider
   * implementation class. Corresponds to the <code>provider</code> element in
   * the <code>persistence.xml</code> file.
   */
  final String persistenceProviderClassName;

  /**
   * Returns the transaction type of the entity managers created by
   * the <code>EntityManagerFactory</code>. The transaction type corresponds to
   * the <code>transaction-type</code> attribute in the <code>persistence.xml</code> file.
   */
  final PersistenceUnitTransactionType transactionType;

  /**
   * Returns the JTA-enabled data source to be used by the
   * persistence provider. The data source corresponds to the
   * <code>jta-data-source</code> element in the <code>persistence.xml</code> file or is
   * provided at deployment or by the container.
   */
  //TODO: implement this
//  DataSource jtaDataSource;

  /**
   * Returns the non-JTA-enabled data source to be used by the
   * persistence provider for accessing data outside a JTA
   * transaction. The data source corresponds to the named
   * <code>non-jta-data-source</code> element in the <code>persistence.xml</code> file or
   * provided at deployment or by the container.
   */
  //TODO: implement this
//  DataSource nonJtaDataSource;

  /**
   * Returns the list of the names of the mapping files that the
   * persistence provider must load to determine the mappings for
   * the entity classes. The mapping files must be in the standard
   * XML mapping format, be uniquely named and be resource-loadable
   * from the application classpath.  Each mapping file name
   * corresponds to a <code>mapping-file</code> element in the
   * <code>persistence.xml</code> file.
   */
  final List<String> mappingFileNames;

  /**
   * Returns the URL for the jar file or directory that is the
   * root of the persistence unit. (If the persistence unit is
   * rooted in the WEB-INF/classes directory, this will be the
   * URL of that directory.)
   * The URL will either be a file: URL referring to a jar file
   * or referring to a directory that contains an exploded jar
   * file, or some other URL from which an InputStream in jar
   * format can be obtained.
   */
  final Uri persistenceUnitRootUrl;

  /**
   * Returns the list of the names of the classes that the
   * persistence provider must add to its set of managed
   * classes. Each name corresponds to a named <code>class</code> element in the
   * <code>persistence.xml</code> file.
   */
  final List<String> managedClassNames;

  /**
   * Returns whether classes in the root of the persistence unit
   * that have not been explicitly listed are to be included in the
   * set of managed classes. This value corresponds to the
   * <code>exclude-unlisted-classes</code> element in the <code>persistence.xml</code> file.
   */
  final bool excludeUnlistedClasses;

  /**
   * Returns the specification of how the provider must use
   * a second-level cache for the persistence unit.
   * The result of this method corresponds to the <code>shared-cache-mode</code>
   * element in the <code>persistence.xml</code> file.
   */
  final SharedCacheMode sharedCacheMode;

  /**
   * Returns the validation mode to be used by the persistence
   * provider for the persistence unit.  The validation mode
   * corresponds to the <code>validation-mode</code> element in the
   * <code>persistence.xml</code> file.
   */
  final ValidationMode validationMode;

  /**
   * Returns a properties object. Each property corresponds to a
   * <code>property</code> element in the <code>persistence.xml</code> file.
   *
   * @return Properties object
   */
  final Map<String, dynamic> properties;

  /**
   * Returns the schema version of the <code>persistence.xml</code> file.
   */
  final String persistenceXMLSchemaVersion;

}
