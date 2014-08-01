//History: Thu, Aug 23, 2012  10:03:40 AM
// Author: hernichen

part of rikulo_orm;

/** + Thrown by the persistence provider when [Query].getSingleResult() or
 * [TypedQuery].getSingleResult() is executed on a query and there is NO
 * result from the query.
 *
 * The current transaction, if one is active, will NOT be marked for rollback.
 *
 * See [Query.getSingleResult], [TypedQuery.getSingleResult]
 */
class NoResultException extends PersistenceException {
  const NoResultException([String message = ""])
      : super(message, null);
}
