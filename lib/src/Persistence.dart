//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  06:45:53 PM
// Author: hernichen

part of rikulo_orm;

/** Singleton to start everything about object persistence */
class Persistence {
  static final String PERSISTENCE_INFO = "rikulo_orm.PersistenceInfo";
  static final String ORM_INFO = "rikulo_orm.OrmInfo";

  /** Connect and return an [EntityManagerFactory] for the persistence unit of
   * the specified [name] and optional [properties].
   * + [name] - the persistence unit name.
   *
   * + [properties] - properties for general purposes; see List below.
   *   (Ref. JPA2 9.4.3). Note property defined here has higer priority than
   *   those defined in [PersistenceInfo].
   *
   *   + Bootstrap
   *     + "rikulo_orm.PersistenceInfo" - optional property to provide a
   *       [PersistenceInfo] persistence information.
   *     + "rikulo_orm.OrmInfo" - optional property to provide an [OrmInfo]
   *        Object/Relational-DB mapping information.
   *
   *   + General
   *     + `rikulo_orm.lock.timeout` - value in milliseconds for pessimistic
   *        lock timeout; override same property in [PersistenceInfo]
   *     + `rikulo_orm.query.timeout` - value in milliseconds for query timeout
   *        ; override same property in [PersistenceInfo].
   *     + `rikulo_orm.provider` - class name of peristence provider; override
   *        corresponding info in [PersistenceInfo].
   *     + `rikulo_orm.transactonType` - transaction type of persistence unit;
   *        override corrsponding info in [PersistenceInfo].
   *     + `rikulo_orm.sharedCache.mode` - override sharedCacheMode of
   *       [PersistenceInfo].
   *     + `rikulo_orm.validation.mode` - override validationMode of
   *       [PersistenceInfo].
   *     + `rikulo_orm.validation.group.pre-persist` - groups that are targeted
   *        for validation upon the pre-persist event; override same property
   *        in [PersistenceInfo]
   *     + `rikulo_orm.validation.group.pre-update` - groups that are targeted
   *        for validation upon the pre-update event; override same property in
   *        [PersistenceInfo].
   *     + `rikulo_orm.validation.group.pre-remove` - groups that are targeted
   *        for validation upon the pre-remove event; override same property in
   *        [PersistenceInfo].
   *
   *   + DataBase Connection
   *     + `rikulo_orm.connection.driver` - qualified name of the driver class.
   *     + `rikulo_orm.connection.url` - driver-specific URL.
   *     + `rikulo_orm.connection.username` - username used by database
   *        connection.
   *     + `rikulo_orm.connection.password` - password used by database
   *        connection.
   *     + `rikulo_orm.connection.poolsize` - connection pool size.
   *     + `rikulo_orm.connection.isolation` - transaction isolation level.
   *     + `rikulo_orm.connectino.autocommit` - enables autocommit for each
   *       transaction.
   *
   *   + SQL control
   *     + `rikulo_orm.sql.fetchsize` - determine the sql statement fetch size.
   *     + `rikulo_orm.sql.batchsize` - batch update size
   *
   *   + Cache control:
   *     + `rikulo_orm.cache.provider` - qualified class name of the custom
   *       [CacheProvider]
   *     + `rikulo_orm.cache.use_minimal_puts - optimize to minimize writes and
   *       more frequently reads; useful for clustered caches.
   *
   *   + Transaction control:
   *     + `rikulo_orm.transaction.factory` - qualified class name used to
   *       create custom [EntityTransaction].
   *
   *   + Other:
   *     + `rikulo_orm.dialect` - dialect class name of the database system.
   *     + `rikulo_orm.show_sql` - write SQL statement to console.
   *     + `rikulo_orm.max_fetch_depth` - sets the maximum "depth" for outer
   *        join fetch for those single ended(one-to-one, many-to-one)
   *        associations.
   *     + `rikulo_orm.default_batch_fetch_size` - default size of batch
   *        fetching.
   *     + `rikulo_orm.order_updates` - whether do entity updates in the
   *        order of primary key.
   */
  static Future<EntityManagerFactory> createEntityManagerFactory(String name,
      [Map properties]) {
    return new PersistenceProviderImpl().createEntityManagerFactory(name, properties);
  }

  /** Return the [PersistenceUtil] instance */
  static PersistenceUtil getPersistenceUtil() {
    return new PersistenceUtilImpl();
  }
}
