
class SqlToken extends Enum {
  static const SqlToken TABLE_DEF = const SqlToken("TABLE_DEF", 0);
  static const SqlToken COLUMN_DEF = const SqlToken("COLUMN_DEF", 1);
  static const SqlToken UNIQUE_CONSTRAINT_DEF = const SqlToken("UNIQUE_CONSTRAINT_DEF", 2);
  static const SqlToken REFERENTIAL_CONSTRAINT_DEF = const SqlToken("REFERENTIAL_CONSTRAINT_DEF", 3);
  static const SqlToken CHECK_CONSTRAINT_DEF = const SqlToken("CHECK_CONSTRAINT_DEF", 4);

  const SqlToken(String name, int ordinal) : super(name, ordinal);
}
