//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 16, 2012  08:12:28 AM
// Author: hernichen

/** Reflection of a Persistence.xml file that contains multiple PersistenceUnit
 * (see [PersistenceUnitInfo]).
 */
class PersistenceInfo {
  List<PersistenceUnitInfo> _unitInfos = new List();

  //TODO: Ref. JPA 2.0 pdf. 8.2.1 persistence.xml file
  //<persistence>
  //  <persistence-unit name="..." transaction-type="...">
  //    <description></description>
  //    <provider></provider>
  //    <jta-data-source></jta-data-source>
  //    <non-jta-data-source></non-jta-data-source>
  //    <mapping-file></mapping-file>
  //    ...
  //    <jar-file></jar-file>
  //    ...
  //    <class></class>
  //    ...
  //    <exclude-unlisted-classes/>
  //    <shared-cache-mode></shared-cache-mode>
  //    <validation-mode></validation-mode>
  //    <properties>
  //      <property name="..." value="..."/>
  //      ...
  //    </properties>
  //  </persistence-unit>
  //  ...
  //</persistence>
  //20120828, henrichen: we don't support description, jta-data-source,
  //  non-jta-data-source, jar-file, exclude-unlisted-classes since no
  //  similar concept/infrastructure in dart language.
  /** Define and add a persistence unit.
   * + [name] - persistence unit name
   * + [transactionType] - transactionType
   * + [provider] - persistence provider class name
   * + [mappingFiles] - persitence mapping file
   * + [classes] - qualified name of managed persistable classes
   * + [sharedCacheMode] - shared cache mode
   * + [validationMode] - validatoin mode
   * + [properties] - properties for general purposes; see List below
   *   + General
   *     + `rikulo:orm.lock.timeout` - value in milliseconds for pessimistic
   *        lock timeout.
   *     + `rikulo:orm.query.timeout` - value in milliseconds for query timeout.
   *     + `rikulo:orm.validation.group.pre-persist` - groups that are targeted
   *        for validation upon the pre-persist event.
   *     + `rikulo:orm.validation.group.pre-update` - groups that are targeted
   *        for validation upon the pre-update event.
   *     + `rikulo:orm.validation.group.pre-remove` - groups that are targeted
   *        for validation upon the pre-remove event.
   *
   *   + DataBase Connection
   *     + `rikulo:orm.connection.driver` - qualified name of the driver class.
   *     + `rikulo:orm.connection.url` - driver-specific URL.
   *     + `rikulo:orm.connection.username` - username used by database
   *        connection.
   *     + `rikulo:orm.connection.password` - password used by database
   *        connection.
   *     + `rikulo:orm.connection.poolsize` - connection pool size.
   *     + `rikulo:orm.connection.isolation` - transaction isolation level.
   *     + `rikulo:orm.connectino.autocommit` - enables autocommit for each
   *       transaction.
   *
   *   + SQL control
   *     + `rikulo:orm.sql.fetchsize` - determine the sql statement fetch size.
   *     + `rikulo:orm.sql.batchsize` - batch update size
   *
   *   + Cache control:
   *     + `rikulo:orm.cache.provider` - qualified class name of the custom
   *       [CacheProvider]
   *     + `rikulo:orm.cache.use_minimal_puts - optimize to minimize writes and
   *       more frequently reads; useful for clustered caches.
   *
   *   + Transaction control:
   *     + `rikulo:orm.transaction.factory` - qualified class name used to
   *       create custom [EntityTransaction].
   *
   *   + Other:
   *     + `rikulo:orm.dialect` - dialect class name of the database system.
   *     + `rikulo:orm.show_sql` - write SQL statement to console.
   *     + `rikulo:orm.max_fetch_depth` - sets the maximum "depth" for outer
   *        join fetch for those single ended(one-to-one, many-to-one)
   *        associations.
   *     + `rikulo:orm.default_batch_fetch_size` - default size of batch
   *        fetching.
   *     + `rikulo:orm.order_updates` - whether do entity updates in the
   *        order of primary key.
   */
  persistenceUnit(String name, [
      TransactionType transactionType = TransactionType.RESOURCE_LOCAL,
      String provider = "rikulo:orm/spi/impl.PersistenceProviderImpl",
      List<String> classes = const [],
      List<String> mappingFiles = const [],
      SharedCacheMode sharedCacheMode = SharedCacheMode.UNSPECIFIED,
      ValidationMode validationMode = ValidationMode.NONE,
      Map<String, dynamic> properties = const {}]) {

    _unitInfos.add(new PersistenceUnitInfoImpl(
        name, transactionType, provider, classes,
        mappingFiles, sharedCacheMode, validationMode, properties));
  }

  /** PersistenceUnitInfo of the specified name  defined in this
   * [PersistenceInfo].
   * + [name] - the persitence unit name.
   */
  List<PersistenceUnitInfo> getPersistenceUnitInfos() {
    return _unitInfos;
  }
}
