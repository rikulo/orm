//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  07:27:14 PM
// Author: hernichen

part of rikulo_orm;

/** + Thrown by persistence provider when entity reference obtained by
 * [EntityManager].getReference is accessed but the entity does not exist.
 *
 *  + Thrown when [EntityManager].refresh is called and the object no longer
 *  exists in the database.
 *
 *  + Thrown when [EntityManager].lock is used with pessimistic locking is used
 *  and the entity is no longer exists in the database.
 *
 * The current transaction, if one is active, WILL be marked for rollback.
 *
 * See [EntityManager.getReference], [EntityManager.refresh],
 * [EntityManager.lock].
 */
class EntityNotFoundException extends PersistenceException {
  const EntityNotFoundException([String message = ""])
      : super(message, null);
}
