//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 17, 2012  09:52:59 AM
// Author: hernichen
//TODO JPA spec. ref http://docs.oracle.com/javaee/6/api/index.html?javax/persistence/PersistenceUnitUtil.html

part of rikulo_orm;

/** Untility interface between the application and the persistence provider that
 * managing the persistence unit.
 */
abstract class PersistenceUnitUtil {
  /**  Return the id of the entity. */
  getIdentifier(var entity);

  /** Determine the load state (of a given attribute) of an entity that
   * belong to the persistence unit.
   * + [entity] - the entity to check its loading state.
   * + [attributeName] - the optional name of the attribute whose load state is
   * to be checked.
   */
  bool isLoaded(var entity, [String attributeName]);
}
