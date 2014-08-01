//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 23, 2012  10:22:17 PM
// Author: hernichen

part of rikulo_orm;

/** Thrown by persistence provider when [EntityManager].commit() fails.
 *
 * See [EntityManager.commit].
 */
class RollbackException extends PersistenceException {
  const RollbackException([String message = "", Exception cause])
      : super(message, cause);
}
