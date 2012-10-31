//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:34:10 PM
// Author: hernichen

/** Specifies how String are trimmed.  */
class Trimspec extends Enum {
  static const Trimspec BOTH = const Trimspec("BOTH", 0);
  static const Trimspec LEADING = const Trimspec("LEADING", 1);
  static const Trimspec TRAILING = const Trimspec("TRAILING", 2);

  const Trimspec(String name, int ordinal) : super(name, ordinal);
}
