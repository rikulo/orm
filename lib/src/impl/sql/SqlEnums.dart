part of rikulo_orm_impl;


/** Used with SqlToken.TABLE_DEF */
enum ScopeEnum {
  GLOBAL,
  LOCAL
}

/** Used with SqlToken.TABLE_DEF */
enum CommitEnum {
  DELETE,
  PRESERVE
}

/** Used with SqlToken.UNIQUE_CONSTRAINT_DEF */
enum UniqueSpecEnum {
  UNIQUE,
  PRIMARY_KEY
}