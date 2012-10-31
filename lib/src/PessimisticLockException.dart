//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 23, 2012  10:15:12 AM
// Author: hernichen

/** + Thrown by the persistence provider when an Pessimistic locking conflict
 *  occurs.
 *
 * This exception may be thrown as part of an API call, at flush or commit time.
 *
 * The current transaction, if one is active, WILL be marked for rollback.
 *
 * See [EntityManager.find], [EntityManager.locak].
 */
class PessimisticLockException extends PersistenceException {
  /** Entity that cause this exception */
  final entity;
  const PessimisticLockException([String message = "", Exception cause, var entity])
      : this.entity = entity,
        super(message, cause);
}
