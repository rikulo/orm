part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Sep 06, 2012  11:05:53 PM
// Author: hernichen

/** Default Sequence Generator */
class SequenceGeneratorImpl implements IdGenerator {
  int _allocationSize;

  int _capacity = 0;
  int _lastValue;

  SequenceGeneratorImpl(SequenceGenerator annt)
      : this._allocationSize = annt.allocationSize {

    //TODO(henri)
    //must be in a SQL transaction!
    //check if the squence exist; create and initialize it if not.
    if (!_existsSequence(annt.sequenceName, annt.schema, annt.catalog))
      _createAndInitSequence(annt);
    else
      _fetchAllocationSize();
  }

  int nextId() {
    if (_capacity == 0)
      _allocateSize();
    return _lastValue + _allocationSize - _capacity--;
  }

  bool _existsSequence(String sequence, String schema, String catalog) {
    //TODO(henri): check from SQL whether the sequence exists
  }

  void _fetchAllocationSize() {
    //TODO(henri) : fetch increment back from the existing sequence
    //_allocationSize = ...
  }

  void _createAndInitSequence(SequenceGenerator annt) {
    if (_allocationSize == null) _allocationSize = 50;
    if (_allocationSize <= 0)
      throw const PersistenceException("SequenceGenerator.allocationSize must greater than zero.");
    String sequence = annt.sequenceName == null ?
        annt.name.toUpperCase() : annt.sequenceName;
    int initval = annt.initialValue == null ? 1 : annt.initialValue;

    //TODO(henri): SQL statement to create sequence
  }

  void _allocateSize() {
    //TODO(henri): must be in a SQL transaction!

    //select next value from Sequence and update into _lastValue;
    //_lastValue = (next value for sequence via sql)

    //restore capacity
    _capacity = _allocationSize;
  }
}
