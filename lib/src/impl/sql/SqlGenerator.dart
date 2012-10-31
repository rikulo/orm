//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Sep 11, 2012  10:15:11 AM
// Author: hernichen

/** Class used to create SQL Script */
class SqlGenerator {
  SqlTypeMapping _typeMapping;
  SqlTokenMapping _templateMapping;

  SqlGenerator() {
    //SQL type mapping
    mapType_(SqlType.BIT, "bit" );
    mapType_(SqlType.BOOLEAN, "boolean" );
    mapType_(SqlType.TINYINT, "tinyint" );
    mapType_(SqlType.SMALLINT, "smallint" );
    mapType_(SqlType.INTEGER, "integer" );
    mapType_(SqlType.BIGINT, "bigint" );
    mapType_(SqlType.FLOAT, "float({p})" );
    mapType_(SqlType.DOUBLE, "double precision" );
    mapType_(SqlType.NUMERIC, "numeric({p},{s})" );
    mapType_(SqlType.REAL, "real" );

    mapType_(SqlType.DATE, "date" );
    mapType_(SqlType.TIME, "time" );
    mapType_(SqlType.TIMESTAMP, "timestamp" );

    mapType_(SqlType.VARBINARY, "bit varying({l})" );
    mapType_(SqlType.LONGVARBINARY, "bit varying({l})" );
    mapType_(SqlType.BLOB, "blob" );

    mapType_(SqlType.CHAR, "char({l})" );
    mapType_(SqlType.VARCHAR, "varchar({l})" );
    mapType_(SqlType.LONGVARCHAR, "varchar({l})" );
    mapType_(SqlType.CLOB, "clob" );

    mapType_(SqlType.NCHAR, "nchar({l})" );
    mapType_(SqlType.NVARCHAR, "nvarchar({l})" );
    mapType_(SqlType.LONGNVARCHAR, "nvarchar({l})" );
    mapType_(SqlType.NCLOB, "nclob" );

    //sql token mapping (ref. http://savage.net.au/SQL/sql-92.bnf.html#table%20definition)
    mapTemplate_(SqlToken.TABLE_DEF,
        "CREATE #{scopeEnum == null ? '' : scopeEnum' TEMPORARY'} TABLE "
        "#{table_name} (#{column_list_def} #{unique_constraint_list_def} "
        "#{referential_constraint_list_def} #{check_constraint_list_def}) "
        "#{commitEnum == null ? '' : 'ON COMMIT 'commitEnum' ROWS'}");

    mapTemplate_(SqlToken.COLUMN_DEF,
        "#{column_name} #{data_type} #{domain_name} #{default_clause} "
        "#{column_constraint_def} #{collate_clause}");

    mapTemplate_(SqlToken.UNIQUE_CONSTRAINT_DEF,
        "#{uniqueSpecEnum}(#{unique_column_list})");

    mapTemplate_(SqlToken.REFERENTIAL_CONSTRAINT_DEF,
        "FOREIGN KEY(#{reference_column_list})#{references_spec}");

    mapTemplate_(SqlToken.CHECK_CONSTRAINT_DEF,
        "CHECK(#{search_cond})");
  }

  /** Returns the sql script of the given [SqlType]. */
  String getTypeScript(SqlType sqlType, [int size, int precision, int scale])
    => _typeMapping.getScript(sqlType, size, precision, scale);

  /** Returns the sql script for creating table per the given EntityType
   * in metamodel.
   */
  String getSqlCreateTable(EntityType entity) {
  }

  /** Returns the sql script for dropping table per the given EntityType
   * in metamodel.
   */
  String getSqlDropTable(EntityType entity) {

  }

  /** Returns the sql script for altering table per the given EntityType
   * in metamodel.
   */
  String getSqlAlterTable(EntityType entity) {

  }

  /** Returns the template string for creating table.
   * + {tb} - table name
   * + {cols} - columns definition
   * + {tb-constraints} - table constraint
   */
  String getCreateTableTemplate_()
    => "CREATE TABLE {tb}({cols} {tb_constraints})";

  /** Returns the template string for dropping table.
   * + {tb} - table name
   */
  String getDropTableTemplate_()
    => "DROP TABLE IF EXISTS {tb}";

  /** Returns the tempalte string for constraint name.
   * + {cname} - constraint name
   */
  String getConstraintNameTemplate_()
    => "CONSTRAINT {cname}";

  /** Returns the template string for column default value.
   * + {val} - column default value
   */
  String getDefaultValueTemplate_()
    => "DEFAULT {val}";

  /** Returns the tempalte string for table constraint.
   * + {cname} - constraint name
   * + {constraint} - see getUnique, getPK, getCheck, getUnique
   */
  String getTableConstraintTemplate_()
    => "{cname} {constraint}";

  /** Returns the template string for column constraint.
   * + {cname} - constraint name
   * + {constarint} - UNIQUE | PRIMARY KEY | getColumnFK | getCheck
   */
  String getColumnConstraintTemplate_()
    => "{cname} {constraint}";

  /** Returns the template string for defining a single column.
   * + {col} - column name
   * + {type} - column type
   * + {null} - NULL | NOT NULL
   * + {default} - default value
   * + {col_constraint} - see getColumnConstraint
   * + {auto_inc} - whether automatically increase this column (aka. auto id)
   */
  String getColumnTemplate_()
    => "{col} {type} {default} {col_constraint} {null} {auto_inc}";

  /** Returns the template string for defining a primary key.
   * + {cols} - columns definition
   */
  String getPKTemplate_()
    => "PRIMARY KEY({cols})";

  /** Returns the tempalte string for defining a unique constraint.
   * + {cols} - columns definition
   */
  String getUniqueTempalte_()
    => "UNIQUE({cols})";

  /** Returns the template string for defining a check constraint.
   * + {cond} - condition
   */
  String getCheckTemplate_()
    => "CHECK({cond})";

  /** Returns the template string for create a new index.
   * + {unique} - UNIQUE | BITMAP
   * + {idx} - index name
   * + {tb} - table name
   * + {cols} - columns defintion
   * + {nosort} - NOSORT | REVERSE
   */
  String getCreateIndexTemplate_()
    => "CREATE {unique} INDEX {idx} ON {tb} ADD INDEX({cols})";

  /** Returns the template string for defining a table foreign key.
   * + {constraint} - constraint string
   * + {cols} - columns definition
   * + {ftb} - foreign table name
   * + {fcols} - foreign columns definition
   */
  String getTableFKTempalte_()
    => "FOREIGN KEY({cols}) REFERENCES {ftb}({fcols})";

  /** Ruturns the template string for defining a column foreign key.
   * + {ftb} - foreign table name
   * + {fcols} - foreign columns
   * + {cascade} - DELETE CASCADE
   */
  String getColumnFKTempalte_()
    => "REFERENCES {ftb}({fcols}) {cascade}";

  /** Map a sql type to a specific sql script */
  void mapType_(SqlType t, String script, [int capacity = 0]) {
    _typeMapping.putScript(t, script, capacity);
  }

  /** Map a sql token to a specific sql script template */
  void mapTemplate_(SqlToken token, String template) {
    _templateMapping.putTemplate(token, template);
  }
}
