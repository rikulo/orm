part of rikulo_orm_impl;


/** Used with SqlToken.TABLE_DEF */
class ScopeEnum extends Enum {
  static const ScopeEnum GLOBAL = const ScopeEnum("GLOBAL", 0);
  static const ScopeEnum LOCAL = const ScopeEnum("LOCAL", 1);

  const ScopeEnum(String name, int ordinal) : super(name, ordinal);
}

/** Used with SqlToken.TABLE_DEF */
class CommitEnum extends Enum {
  static const CommitEnum DELETE = const CommitEnum("DELETE", 0);
  static const CommitEnum PRESERVE = const CommitEnum("PRESERVE", 0);

  const CommitEnum(String name, int ordinal) : super(name, ordinal);
}

/** Used with SqlToken.UNIQUE_CONSTRAINT_DEF */
class UniqueSpecEnum extends Enum {
  static const UniqueSpecEnum UNIQUE = const UniqueSpecEnum("UNIQUE", 0);
  static const UniqueSpecEnum PRIMARY_KEY = const UniqueSpecEnum("PRIMARY KEY", 0);

  const UniqueSpecEnum(String name, int ordinal) : super(name, ordinal);
}