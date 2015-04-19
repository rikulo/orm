//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** How the EntityManager handle 2nd-level cache for the persistence unit. */
class ValidationMode extends Enum {
  static const ValidationMode AUTO = const ValidationMode("AUTO");
  static const ValidationMode CALLBACK = const ValidationMode("CALLBACK");
  static const ValidationMode NONE = const ValidationMode("NONE");

  const ValidationMode(String name) : super(name);
}
