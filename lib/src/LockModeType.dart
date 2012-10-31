//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:37:23 PM
// Author: hernichen

/** LockMode of Entity */
class LockModeType extends Enum {
  static const LockModeType NONE = const LockModeType("NONE", 0);
  static const LockModeType OPTIMISTIC = const LockModeType("OPTIMISTIC", 1);
  static const LockModeType OPTIMISTIC_FORCE_INCREMENT = const LockModeType("OPTIMISTIC_FORCE_INCREMENT", 2);
  static const LockModeType PESSIMISTIC_FORCE_INCREMENT = const LockModeType("PESSIMISTIC_FORCE_INCREMENT", 3);
  static const LockModeType PESSIMISTIC_READ = const LockModeType("PESSIMISTIC_READ", 4);
  static const LockModeType PESSIMISTIC_WRITE = const LockModeType("PESSIMISTIC_WRITE", 5);
  static const LockModeType READ = const LockModeType("READ", 6);
  static const LockModeType WRITE = const LockModeType("WRITE", 7);

  const LockModeType(String name, int ordinal) : super(name, ordinal);
}
