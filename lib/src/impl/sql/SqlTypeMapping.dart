part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Sep 11, 2012  11:21:30 AM
// Author: hernichen

/** Mapping from standard SqlType to Sql script */
class SqlTypeMapping {
  Map<SqlType, Map<int, String>> _mapping = {}; //sqltype -> capacity -> script

  /**
   * Gets the [SqlType] script mapped with [putScript]
   *
   *      getScript(SqlType.STRING) => "TEXT"
   *      getScript(SqlType.STRING, 100) => "VARCHAR(100)" (100 is between 0~255)
   *      getScript(SqlType.STRING, 1000) => "LONGVARCHAR(1000)" (1000 is between 256~65534)
   *      getScript(SqlType.STRING, 100000) => "TEXT" (100000 > 65534)
   */
  String getScript(SqlType sqlType, [int size, int precision, int scale]) {
    Map<int, String> scripts = _mapping[sqlType];
    var result;
    if (scripts != null && scripts.length > 0) {
      if (size != null) {
        scripts.forEach((capacity, script) {
          if (size <= capacity) {
            result = replace(script, size, precision, scale);
          }
        });
        return result;
      }
      return replace(scripts[0], size, precision, scale);
    }
    throw new PersistenceException("Cannot find proper mapping for SqlType: ${sqlType}");
  }

  /** Map SqlType to sql script with an optional capacity.
   * capacity is used to map to different sql script with conditional size.
   * e.g. 
   *      putScript(SqlType.STRING, "TEXT");
   *      putScript(SqlType.STRING, "VARCHAR($l)", 255);
   *      putScript(SqlType.STRING, "LONGVARCHAR($l)", 65534);
   *
   */
  void put(SqlType sqlType, String script, [int capacity = 0]) {
    _mapping.putIfAbsent(sqlType, () => {capacity: script});
  }

  void addAll(Map<SqlType, Map<int, String>> map) {
    _mapping.addAll(map);
  }

  String replace(String script, int size, int precision, int scale) =>
      TextFormat.format(script, {"l" : size, "p" : precision, "s" : scale});
}
