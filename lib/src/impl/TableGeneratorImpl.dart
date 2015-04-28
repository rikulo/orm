part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Sep 06, 2012  11:05:53 PM
// Author: hernichen

/** Default Table Generator */
class TableGeneratorImpl implements IdGenerator {
  int _allocationSize;

  int _capacity = 0;
  int _lastValue;

  TableGeneratorImpl(TableGenerator annt)
      : this._allocationSize = annt.allocationSize {
    if (_allocationSize == null) _allocationSize = 50;
    if (_allocationSize <= 0)
      throw const PersistenceException("TableGenerator.allocationSize must greater than zero.");

    //TODO(henri)
    //must be in a SQL transaction!
    //check if the table exist; create and initialize it if not.
    if (!_existsTable(annt.table, annt.schema, annt.catalog))
      _createAndInitTable(annt);
    else
      _fetchAllocationSize();
  }

  int nextId() {
    if (_capacity == 0)
      _allocateSize();
    return _lastValue + _allocationSize - _capacity--;
  }

  bool _existsTable(String table, String schema, String catalog) {
    //TODO(henri) : check from SQL whether the table exists
  }

  void _fetchAllocationSize() {
    //TODO(henri) : fetch increment back from the existing sequence
    //_allocationSize = ...
  }

  void _createAndInitTable(TableGenerator annt) {
    String table = annt.table == null ? "RIKULO_ID_GEN" : annt.table;
    String pkcol = annt.pkColumnName == null ? "KEY" : annt.pkColumnName;
    String valcol = annt.valueColumnName == null ? "VAL" : annt.valueColumnName;
    String pkval = annt.pkColumnValue == null ? annt.name : annt.pkColumnValue;
    int initval = annt.initialValue == null ? 0 : annt.initialValue;

    //TODO(henri): SQL statement to create table

    //TODO(henri): SQL statement to init table
  }

  void _allocateSize() {
    //TODO(henri): must be in a SQL transaction!
    //update the valueColumn with new lastValue.
    //_lastValue = (lastValue in sql) + _annt.allocaton

    //restore capacity
    _capacity = _allocationSize;
  }
}
