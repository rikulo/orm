//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 23, 2012  10:18:07 AM
// Author: hernichen

part of rikulo_orm;

/** + Thrown by the persistence provider when a query times out and only the
 * query statement is rolled back.
 *
 * The current transaction, if one is active, will NOT be marked for rollback.
 */
class QueryTimeoutException extends PersistenceException {
  /** Entity that cause this exception */
  final Query query;
  const QueryTimeoutException(
      [String message = "", Exception cause, Query query])
      : this.query = query,
        super(message, cause);
}
