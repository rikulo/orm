//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  07:17:14 PM
// Author: hernichen

/** Thrown by persistence provider when [EntityManager].persist() is called
 * and entity already exists.
 *
 * Current transaction, if one is alive, WILL be marked for rollback.
 *
 * If the entity already exists, the EntityExistsException may be thrown when
 * the persist operation is invoked, or at flush or commit time.
 *
 * See [EntityManager.persist].
 */
class EntityExistsException extends PersistenceException {
  const EntityExistsException([String message = "", Exception cause])
      : super(message, cause);
}
