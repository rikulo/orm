//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  07:03:44 PM
// Author: hernichen

part of rikulo_orm;

/** Base persistence exception */
class PersistenceException implements Exception {
  /** Exception message */
  final String message;
  /** The Exception that cause this exception (generally SQL exception) */
  final Exception cause;
  const PersistenceException([String message = "", Exception cause])
      : this.message = message,
        this.cause = cause;
}
