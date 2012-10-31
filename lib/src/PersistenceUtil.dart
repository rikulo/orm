//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 17, 2012  09:46:12 AM
// Author: hernichen
//TODO JPA spec. ref http://docs.oracle.com/javaee/6/api/index.html?javax/persistence/PersistenceUtil.html

/** Untity inteface between the application and the persistence provider.
 *
 * The PersistenceUtil obtained from the [Persistence] class is used to
 * determine the load state of an entity or entity attribute regardless
 * of which persistence provider in the environment created the entity.
 */
abstract class PersistenceUtil {
  /** Check the load state (of a given attribute) of an entity.
   * + [entity] - the entity to be checked of its load state.
   * + [attributeName] - the name of the attribute whose load state is to be
   * checked.
   */
  bool isLoaded(var entity, [String attributeName]);
}
