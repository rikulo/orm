//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Sep 11, 2012  11:51:01 AM
// Author: hernichen

/** SQL Types */
class SqlType extends Enum {
  static const SqlType ARRAY = const SqlType("ARRAY", 0);
  static const SqlType BIGINT = const SqlType("BIGINT", 1);
  static const SqlType BINARY = const SqlType("BINARY", 2);
  static const SqlType BIT = const SqlType("BIT", 3);
  static const SqlType BLOB = const SqlType("BLOB", 4);
  static const SqlType BOOLEAN = const SqlType("BOOLEAN", 5);
  static const SqlType CHAR = const SqlType("CHAR", 6);
  static const SqlType CLOB  = const SqlType("CLOB", 7);
  static const SqlType DATALINK = const SqlType("DATALINK", 8);
  static const SqlType DATE = const SqlType("DATE", 9);
  static const SqlType DECIMAL = const SqlType("DECIMAL", 10);
  static const SqlType DISTINCT = const SqlType("DISTINCT", 11);
  static const SqlType DOUBLE = const SqlType("DOUBLE", 12);
  static const SqlType FLOAT = const SqlType("FLOAT", 13);
  static const SqlType INTEGER = const SqlType("INTEGER", 14);
  static const SqlType DART_OBJECT = const SqlType("DART_OBJECT", 15);
  static const SqlType LONGNVARCHAR = const SqlType("LONGNVARCHAR", 16);
  static const SqlType LONGVARBINARY = const SqlType("LONGVARBINARY", 17);
  static const SqlType LONGVARCHAR = const SqlType("LONGVARCHAR", 18);
  static const SqlType NCHAR = const SqlType("NCHAR", 19);
  static const SqlType NCLOB = const SqlType("NCLOB", 20);
  static const SqlType NULL = const SqlType("NULL", 21);
  static const SqlType NUMERIC = const SqlType("NUMERIC", 22);
  static const SqlType NVARCHAR = const SqlType("NVARCHAR", 23);
  static const SqlType OTHER = const SqlType("OTHER", 24);
  static const SqlType REAL = const SqlType("REAL", 25);
  static const SqlType REF = const SqlType("REF", 26);
  static const SqlType ROWID = const SqlType("ROWID", 27);
  static const SqlType SMALLINT = const SqlType("SMALLINT", 28);
  static const SqlType SQLXML = const SqlType("SQLXML", 29);
  static const SqlType STRUCT = const SqlType("STRUCT", 30);
  static const SqlType TIME = const SqlType("TIME", 31);
  static const SqlType TIMESTAMP = const SqlType("TIMESTAMP", 32);
  static const SqlType TINYINT = const SqlType("TINYINT", 33);
  static const SqlType VARBINARY = const SqlType("VARBINARY", 34);
  static const SqlType VARCHAR = const SqlType("VARCHAR", 35);

  const SqlType(String name, int ordinal) : super(name, ordinal);
}
