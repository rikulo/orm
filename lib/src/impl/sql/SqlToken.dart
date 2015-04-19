part of rikulo_orm_impl;


class SqlToken extends Enum {
  static const SqlToken TABLE_DEF = const SqlToken("TABLE_DEF");
  static const SqlToken COLUMN_DEF = const SqlToken("COLUMN_DEF");
  static const SqlToken UNIQUE_CONSTRAINT_DEF = const SqlToken("UNIQUE_CONSTRAINT_DEF");
  static const SqlToken REFERENTIAL_CONSTRAINT_DEF = const SqlToken("REFERENTIAL_CONSTRAINT_DEF");
  static const SqlToken CHECK_CONSTRAINT_DEF = const SqlToken("CHECK_CONSTRAINT_DEF");

  const SqlToken(String name) : super(name);
}
