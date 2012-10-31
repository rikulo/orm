//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

/** How the EntityManager handle 2nd-level cache for the persistence unit. */
class ValidationMode extends Enum {
  static const ValidationMode AUTO = const ValidationMode("AUTO", 0);
  static const ValidationMode CALLBACK = const ValidationMode("CALLBACK", 1);
  static const ValidationMode NONE = const ValidationMode("NONE", 2);

  const ValidationMode(String name, int ordinal) : super(name, ordinal);
}
