//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  07:35:27 PM
// Author: hernichen

part of rikulo_orm;

/** + Thrown by the persistence provider when an pessimistic locking conflict
 *  occurs that does not result in transaction rollback.
 *
 *  This exception may be thrown as part of an API call at flush or commit time.
 *
 * The current transaction, if one is active, will NOT be marked for rollback.
 *
 * See [EntityManager.getReference], [EntityManager.refresh],
 * [EntityManager.lock].
 */
class LockTimeoutException extends PersistenceException {
  /** Entity that cause this exception */
  final entity;
  const LockTimeoutException([String message = "", Exception cause, var entity])
      : this.entity = entity,
        super(message, cause);
}
