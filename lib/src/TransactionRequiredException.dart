//History: Wed, Aug 22, 2012  07:40:52 PM
// Author: hernichen

/** + Thrown by the persistence provider when a transaction is required ut
 * is not active.
 */
class TransactionRequiredException extends PersistenceException {
  const TransactionRequiredException([String message = ""])
      : super(message, null);
}
