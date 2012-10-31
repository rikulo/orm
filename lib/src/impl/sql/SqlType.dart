//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Sep 11, 2012  11:51:01 AM
// Author: hernichen

/** SQL Types */
class SqlType extends Enum {
  static final SqlType ARRAY = const SqlType("ARRAY", 0);
  static final SqlType BIGINT = const SqlType("BIGINT", 1);
  static final SqlType BINARY = const SqlType("BINARY", 2);
  static final SqlType BIT = const SqlType("BIT", 3);
  static final SqlType BLOB = const SqlType("BLOB", 4);
  static final SqlType BOOLEAN = const SqlType("BOOLEAN", 5);
  static final SqlType CHAR = const SqlType("CHAR", 6);
  static final SqlType CLOB  = const SqlType("CLOB", 7);
  static final SqlType DATALINK = const SqlType("DATALINK", 8);
  static final SqlType DATE = const SqlType("DATE", 9);
  static final SqlType DECIMAL = const SqlType("DECIMAL", 10);
  static final SqlType DISTINCT = const SqlType("DISTINCT", 11);
  static final SqlType DOUBLE = const SqlType("DOUBLE", 12);
  static final SqlType FLOAT = const SqlType("FLOAT", 13);
  static final SqlType INTEGER = const SqlType("INTEGER", 14);
  static final SqlType DART_OBJECT = const SqlType("DART_OBJECT", 15);
  static final SqlType LONGNVARCHAR = const SqlType("LONGNVARCHAR", 16);
  static final SqlType LONGVARBINARY = const SqlType("LONGVARBINARY", 17);
  static final SqlType LONGVARCHAR = const SqlType("LONGVARCHAR", 18);
  static final SqlType NCHAR = const SqlType("NCHAR", 19);
  static final SqlType NCLOB = const SqlType("NCLOB", 20);
  static final SqlType NULL = const SqlType("NULL", 21);
  static final SqlType NUMERIC = const SqlType("NUMERIC", 22);
  static final SqlType NVARCHAR = const SqlType("NVARCHAR", 23);
  static final SqlType OTHER = const SqlType("OTHER", 24);
  static final SqlType REAL = const SqlType("REAL", 25);
  static final SqlType REF = const SqlType("REF", 26);
  static final SqlType ROWID = const SqlType("ROWID", 27);
  static final SqlType SMALLINT = const SqlType("SMALLINT", 28);
  static final SqlType SQLXML = const SqlType("SQLXML", 29);
  static final SqlType STRUCT = const SqlType("STRUCT", 30);
  static final SqlType TIME = const SqlType("TIME", 31);
  static final SqlType TIMESTAMP = const SqlType("TIMESTAMP", 32);
  static final SqlType TINYINT = const SqlType("TINYINT", 33);
  static final SqlType VARBINARY = const SqlType("VARBINARY", 34);
  static final SqlType VARCHAR = const SqlType("VARCHAR", 35);

  const SqlType(String name, int ordinal) : super(name, ordinal);
}
