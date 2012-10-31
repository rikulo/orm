//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  01:03:13 PM
// Author: hernichen

/** Entity state is maintained in this class */
//TODO(henri)
class PersistenceUnitUtilImpl implements PersistenceUnitUtil {
  EntityManagerFactory _emf;

  PersistenceUnitUtilImpl(EntityManagerFactory emf)
      : _emf = emf;

  /**  Return the id of the entity. */
  getIdentifier(var entity) {
    return null;
  }

  /** Determine the load state (of a given attribute) of an entity that
   * belong to the persistence unit.
   * + [entity] - the entity to check its loading state.
   * + [attributeName] - the optional name of the attribute whose load state is
   * to be checked.
   */
  bool isLoaded(var entity, [String attributeName]) {
    return false;
  }
}
