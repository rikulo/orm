//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Sep 11, 2012  11:21:30 AM
// Author: hernichen

/** Mapping from standard SqlType to Sql script */
class SqlTokenMapping {
  Map<SqlToken, String> _mapping; //sqltoken -> script template

  /** Returns sql script tempalte */
  String getTemplate(SqlToken sqlToken) => _mapping[sqlToken];

  /** Map SqlToken to sql script template */
  void putTemplate(SqlToken sqlToken, String template) {
    _mapping[sqlToken] = template;
  }
}
