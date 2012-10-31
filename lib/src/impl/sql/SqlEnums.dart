
/** Used with SqlToken.TABLE_DEF */
class ScopeEnum extends Enum {
  static final ScopeEnum GLOBAL = const ScopeEnum("GLOBAL", 0);
  static final ScopeEnum LOCAL = const ScopeEnum("LOCAL", 1);

  const ScopeEnum(String name, int ordinal) : super(name, ordinal);
}

/** Used with SqlToken.TABLE_DEF */
class CommitEnum extends Enum {
  static final CommitEnum DELETE = const CommitEnum("DELETE", 0);
  static final CommitEnum PRESERVE = const CommitEnum("PRESERVE", 0);

  const CommitEnum(String name, int ordinal) : super(name, ordinal);
}

/** Used with SqlToken.UNIQUE_CONSTRAINT_DEF */
class UniqueSpecEnum extends Enum {
  static final UniqueSpecEnum UNIQUE = const UniqueSpecEnum("UNIQUE", 0);
  static final UniqueSpecEnum PRIMARY_KEY = const UniqueSpecEnum("PRIMARY KEY", 0);

  const UniqueSpecEnum(String name, int ordinal) : super(name, ordinal);
}