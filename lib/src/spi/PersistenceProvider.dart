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
 * Interface implemented by the persistence provider.
 *
 * <p> It is invoked by the container in Java EE environments and
 * by the {@link javax.persistence.Persistence} class in Java SE environments to
 * create an {@link javax.persistence.EntityManagerFactory}.
 *
 * @since Java Persistence 1.0
 */
abstract class PersistenceProvider {
  /**
   * Called by <code>Persistence</code> class when an
   * <code>EntityManagerFactory</code> is to be created.
   *
   * @param emName the name of the persistence unit
   * @param map a Map of properties for use by the
   * persistence provider. These properties may be used to
   * override the values of the corresponding elements in
   * the <code>persistence.xml</code> file or specify values for
   * properties not specified in the <code>persistence.xml</code>
   * (and may be null if no properties are specified).
   */
  Future<EntityManagerFactory> createEntityManagerFactory(String emName, Map map);

  /**
   * Called by the container when an <code>EntityManagerFactory</code>
   * is to be created.
   *
   * @param info metadata for use by the persistence provider
   * @param map a Map of integration-level properties for use
   * by the persistence provider (may be null if no properties
   * are specified).
   * If a Bean Validation provider is present in the classpath,
   * the container must pass the <code>ValidatorFactory</code> instance in
   * the map with the key <code>"javax.persistence.validation.factory"</code>.
   *
   * @return EntityManagerFactory for the persistence unit
   *         specified by the metadata
   */
  Future<EntityManagerFactory> createContainerEntityManagerFactory(PersistenceUnitInfo info, Map map);

  /**
   * Create database schemas and/or tables and/or create DDL
   * scripts as determined by the supplied properties.
   *
   * Called by the container when schema generation is to
   * occur as a separate phase from creation of the entity
   * manager factory.
   *
   * @param info metadata for use by the persistence provider
   * @param map properties for schema generation; these may also include provider-specific properties
   *
   * @throws javax.persistence.PersistenceException if insufficient or inconsistent configuration information is
   * provided or if schema generation otherwise fails.
   */
  void generateSchema(PersistenceUnitInfo info, Map map);

  /**
   * Return the utility interface implemented by the persistence
   * provider.
   *
   * @return ProviderUtil interface
   *
   * @since Java Persistence 2.0
   */
  ProviderUtil get providerUtil;
}

