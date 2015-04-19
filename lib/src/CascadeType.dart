part of rikulo_orm;

/** Defines the cascadable operations that propagated to referred entity */
class CascadeType extends  Enum {
  static const CascadeType ALL = const CascadeType("ALL");
  static const CascadeType DETACH = const CascadeType("DETACH");
  static const CascadeType MERGE = const CascadeType("MERGE");
  static const CascadeType PERSIST = const CascadeType("PERSIST");
  static const CascadeType REFRESH = const CascadeType("REFRESH");
  static const CascadeType REMOVE = const CascadeType("REMOVE");

  const CascadeType(String name) : super(name);
}
