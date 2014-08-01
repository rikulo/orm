part of rikulo_orm;

/** Defines the cascadable operations that propagated to referred entity */
class CascadeType extends  Enum {
  static const CascadeType ALL = const CascadeType("ALL", 0);
  static const CascadeType DETACH = const CascadeType("DETACH", 1);
  static const CascadeType MERGE = const CascadeType("MERGE", 2);
  static const CascadeType PERSIST = const CascadeType("PERSIST", 3);
  static const CascadeType REFRESH = const CascadeType("REFRESH", 4);
  static const CascadeType REMOVE = const CascadeType("REMOVE", 5);

  const CascadeType(String name, int ordinal) : super(name, ordinal);
}
