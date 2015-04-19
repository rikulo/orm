part of rikulo_orm_impl;


/** Used with SqlToken.TABLE_DEF */
class ScopeEnum extends Enum {
  static const ScopeEnum GLOBAL = const ScopeEnum("GLOBAL");
  static const ScopeEnum LOCAL = const ScopeEnum("LOCAL");

  const ScopeEnum(String name) : super(name);
}

/** Used with SqlToken.TABLE_DEF */
class CommitEnum extends Enum {
  static const CommitEnum DELETE = const CommitEnum("DELETE");
  static const CommitEnum PRESERVE = const CommitEnum("PRESERVE");

  const CommitEnum(String name) : super(name);
}

/** Used with SqlToken.UNIQUE_CONSTRAINT_DEF */
class UniqueSpecEnum extends Enum {
  static const UniqueSpecEnum UNIQUE = const UniqueSpecEnum("UNIQUE");
  static const UniqueSpecEnum PRIMARY_KEY = const UniqueSpecEnum("PRIMARY KEY");

  const UniqueSpecEnum(String name) : super(name);
}