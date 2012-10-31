/** Defines the cascadable operations that propagated to referred entity */
class CascadeType extends  Enum {
  static final CascadeType ALL = const CascadeType("ALL", 0);
  static final CascadeType DETACH = const CascadeType("DETACH", 1);
  static final CascadeType MERGE = const CascadeType("MERGE", 2);
  static final CascadeType PERSIST = const CascadeType("PERSIST", 3);
  static final CascadeType REFRESH = const CascadeType("REFRESH", 4);
  static final CascadeType REMOVE = const CascadeType("REMOVE", 5);

  const CascadeType(String name, int ordinal) : super(name, ordinal);
}
