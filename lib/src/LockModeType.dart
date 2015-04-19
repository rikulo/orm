//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:37:23 PM
// Author: hernichen

part of rikulo_orm;

/** LockMode of Entity */
class LockMode extends Enum {
  static const LockMode NONE = const LockMode("NONE");
  static const LockMode OPTIMISTIC = const LockMode("OPTIMISTIC");
  static const LockMode OPTIMISTIC_FORCE_INCREMENT = const LockMode("OPTIMISTIC_FORCE_INCREMENT");
  static const LockMode PESSIMISTIC_FORCE_INCREMENT = const LockMode("PESSIMISTIC_FORCE_INCREMENT");
  static const LockMode PESSIMISTIC_READ = const LockMode("PESSIMISTIC_READ");
  static const LockMode PESSIMISTIC_WRITE = const LockMode("PESSIMISTIC_WRITE");
  static const LockMode READ = const LockMode("READ");
  static const LockMode WRITE = const LockMode("WRITE");
  
  const LockMode(String name) : super(name);
}
