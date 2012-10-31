//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 13, 2012  01:14:23 PM
// Author: hernichen

/** Persistence transaction */
abstract class EntityTransaction {
  /** Start a resource transaction */
  void begin();

  /** commit the transaction */
  void commit();

  /** rollback the transaction; ignore all modification */
  void rollback();

  /** whether this transaction has been marked for rollback */
  bool getRollbackOnly();

  /** Mark the current resource transaction as only for rollback */
  void setRollbackOnly();

  /** Whether a resource transaction is in progress */
  bool isActive();
}
