
class SqlToken extends Enum {
  static final SqlToken TABLE_DEF = const SqlToken("TABLE_DEF", 0);
  static final SqlToken COLUMN_DEF = const SqlToken("COLUMN_DEF", 1);
  static final SqlToken UNIQUE_CONSTRAINT_DEF = const SqlToken("UNIQUE_CONSTRAINT_DEF", 2);
  static final SqlToken REFERENTIAL_CONSTRAINT_DEF = const SqlToken("REFERENTIAL_CONSTRAINT_DEF", 3);
  static final SqlToken CHECK_CONSTRAINT_DEF = const SqlToken("CHECK_CONSTRAINT_DEF", 4);

  const SqlToken(String name, int ordinal) : super(name, ordinal);
}
