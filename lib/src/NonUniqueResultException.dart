//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  07:35:27 PM
// Author: hernichen

part of rikulo_orm;

/** + Thrown by the persistence provider when [Query].getSingleResult() or
 * [TypedQuery].getSingleResult() is executed on a query and there is more than
 * one result from the query.
 *
 * The current transaction, if one is active, will NOT be marked for rollback.
 *
 * See [Query.getSingleResult], [TypedQuery.getSingleResult]
 */
class NonUniqueResultException extends PersistenceException {
  const NonUniqueResultException([String message = ""])
      : super(message, null);
}
