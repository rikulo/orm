part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  11:03:45 AM
// Author: hernichen

/** Implementation of [EntityManagerFactory] */
class EntityManagerFactoryImpl implements EntityManagerFactory {
  final Map<String, dynamic> _properties;
  final PersistenceUnitInfo _uinfo;
  final Metamodel _mmodel;
  bool _open;
  PersistenceUnitUtil _uutil;

  EntityManagerFactoryImpl(this._uinfo, this._mmodel, this._properties) {
    _open = true;
  }

  EntityManager createEntityManager([Map properties]) {
    return new EntityManagerImpl(this, properties);
  }

  bool isOpen() => _open;

  void close() {
    //TODO(henri): release all resources associated
    _open = false;
  }

  Map<String, dynamic> getProperties() => _properties;

  /** Returns an instance of [Metamodel] for access to the metamodel of the
   * persitence unit.
   */
  Metamodel getMetamodel() => _mmodel;

  /** Returns the helping utility for the persistence unit. */
  PersistenceUnitUtil getPersistenceUnitUtil() {
    if (_uutil == null)
      _uutil = new PersistenceUnitUtilImpl(this);

    return _uutil;
  }

  /** Returns an instance of [CriteriaBuilder] for the creation of the
   * [CriteriaQuery] objects.
   */
  //TODO(henri): not support Criteria yet.
  CriteriaBuilder getCriteriaBuilder() {
    throw new UnimplementedError("getCriteriaBuilder");
  }

  /** Returns the cache that is associated with this [entityMangerFactory] */
  //TODO(henri): not implemented cache yet.
  Cache getCache() {
    throw new UnimplementedError("getCache");
  }
}
