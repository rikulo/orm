//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:37:23 PM
// Author: hernichen

/** LockMode of Entity */
class LockModeType extends Enum {
  static final LockModeType NONE = const LockModeType("NONE", 0);
  static final LockModeType OPTIMISTIC = const LockModeType("OPTIMISTIC", 1);
  static final LockModeType OPTIMISTIC_FORCE_INCREMENT = const LockModeType("OPTIMISTIC_FORCE_INCREMENT", 2);
  static final LockModeType PESSIMISTIC_FORCE_INCREMENT = const LockModeType("PESSIMISTIC_FORCE_INCREMENT", 3);
  static final LockModeType PESSIMISTIC_READ = const LockModeType("PESSIMISTIC_READ", 4);
  static final LockModeType PESSIMISTIC_WRITE = const LockModeType("PESSIMISTIC_WRITE", 5);
  static final LockModeType READ = const LockModeType("READ", 6);
  static final LockModeType WRITE = const LockModeType("WRITE", 7);

  const LockModeType(String name, int ordinal) : super(name, ordinal);
}
