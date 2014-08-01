part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Sep 07, 2012  06:51:32 PM
// Author: hernichen

/** Implementation of EntityManager */
class EntityManagerImpl implements EntityManager {
  final EntityManagerFactoryImpl _emf;
  Map<dynamic, EntityInfo> _entities = new Map();
  Map _properties;
  bool _open = true;

  EntityManagerImpl(EntityManagerFactoryImpl emf, [Map properties])
      : this._emf = emf {
    this._properties = new Map.from(properties);
  }

  /** Start a transaction in a seperate thread and execute the exec function.
   * Note the exec function must return a Future that would pass the results of
   * the execution as the "value" argument to the returned Future in the
   * Future.then(void onSuccess(T value) {}) method when done the transaction.
   */
//  Future asyncTransaction(Future exec(EntityManager em, EntityTransaction tx),
//      [TransactionModeType mode = TransactionModeType.READ_ONLY]);

  /** Clear the associated persistence context; i.e. detach all managed
   * entities.
   */
  void clear() {
    _entities.keys.forEach((entity) {
      detach(entity);
    });
  }

  /** Remove the given entity from the associated persistence context */
  void detach(var entity) {
    _entities.remove(entity);
  }

  /** Whether the specified entity belongs to the associated persistence context */
  bool contains(var entity) => _entities.containsKey(entity);

  /** Add the given entity into the associated persistence context; i.e. make
   * the entity a persistence managed entity.
   */
  void persist(var entity);

  /** Return a cloned managed entity which is merged the state of the given
   * entity. Note the cloned is add into the associated persistence context but
   * not the given one.
   */
  void merge(var entity);

  /** Remove the entity */
  void remove(var entity);

  /** Refresh the state of the given entity from the db with optional
   * [properties] and then lock the [entity] with optional [LockModeType]. All
   * changes made to the entity would be overwritten by the refreshing if any.
   */
  void refresh(var entity, [LockModeType lockMode, Map properties]);

  /** Sync persistence context to the db (but not commit) */
  void flush();

  /** Flush mode applied to all entities in the associated persistence
   * context(see [FlushModeType]).
   */
  FlushModeType getFlushMode();

  void setFlushMode(FlushModeType flushMode);

  /** Returns properties and hints and associated values for this EntityManager.
   *  Note this is for read only. Change contents of the properties Map does
   *  not change the behavior of the EntityManager.
   */
  Map<String, dynamic> getProperties() => _properties;

  /** Set a property for this EntityManager. */
  void setProperty(String propertyName, var value) {
    _properties[propertyName] = value;
  }

  /** current [LockModeType] for the specified [entity]. */
  LockModeType getLockMode(var entity) {
    EntityInfo info = _entities[entity];
    return info == null ? null : info.lockMode;
  }

  /** Returns an instance whose state can be lazily fetched. */
  getReference(ClassMirror type, var id);

  /** Returns the resource-level EntityTransaction object */
  EntityTransaction getTransaction();

  /** find by Id */
  find(ClassMirror type, var id, [Map properties, LockModeType lockMode]);

  /** lock an entity instance with the specified [LockModeType] and optional [properties] */
  void lock(var entity, LockModeType lockMode, [Map properties]);

  //TODO(henri): Query is not supported yet
//  Query createQuery(String qlString, [Type resultType]);
//
//  Query createCriteriaQuery(CriteriaQuery criteriaQuery); //create a
//
//  Query createNamedQuery(String name, [Type resultType]); //create a named QL/native SQL query
//
//  Query createNativeQuery(String sqlString, [String resultSetMapping]); //create native SQL query
//
//  void joinTransaction(); //associate this EntityManager to the current JTA transaction
//
//  CriteriaBuilder getCriteriaBuilder(); //criteriaBuilder for creating CriteriaQuery
//

  //return the under the hood EntityManager implementation
  unwrap(ClassMirror type) {
    return ClassUtil.isAssignableFrom(type, reflect(this).type) ? this : null;
  }

  //return the under the hood EntityManager implementation.
  getDelegate() => this;

  /** Close this EntityManager */
  void close() {
    _open = false;
    clear();
  }

  /** Whether this EntityManager is open */
  bool isOpen() => _open;

  /** Return the EntityManagerFactory that create this EntityManager. */
  EntityManagerFactory getEntityManagerFactory() => _emf;

  Metamodel getMetamodel() => _emf.getMetamodel(); //metamodel for persistence unit
}
