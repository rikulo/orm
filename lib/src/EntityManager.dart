//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 13, 2012  10:23:06 AM
// Author: hernichen

/** Track entities with a persistence context */
abstract class EntityManager {
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
  void clear();

  /** Remove the given entity from the associated persistence context */
  void detach(var entity);

  /** Whether the specified entity belongs to the associated persistence context */
  bool contains(var entity);

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

  /** Set teh flush mode that applies to all objects conained in the persistece
   * context.
   */
  void setFlushMode(FlushModeType flushMode);

  /** Returns properties and hints and associated values for this EntityManager.
   *  Note this is for read only. Change contents of the properties Map does
   *  not change the behavior of the EntityManager.
   */
  Map<String, dynamic> getProperties();

  /** Set a property for this EntityManager. */
  void setProperty(String propertyName, var value);

  /** current [LockModeType] for the specified [entity]. */
  LockModeType getLockMode(var entity);

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
  /** return the under the hood EntityManager implementation per the given
   * qualified class name
   * + [type] - the type of the object to be raturned.
   *   This is normally either the underlying EntityManager implementation class
   *   or an interface it implements.
   */
  unwrap(ClassMirror type);

  /** return the under the hood EntityManager implementation */
  getDelegate();

  /** Close this EntityManager */
  void close();

  /** Whether this EntityManager is open */
  bool isOpen();

  /** Return the EntityManagerFactory that create this EntityManager. */
  EntityManagerFactory getEntityManagerFactory();

  /** Returns the instance of Metamodel interface for access to the metamodel
   * of the persistence unit.
   */
  Metamodel getMetamodel(); //metamodel for persistence unit

}
