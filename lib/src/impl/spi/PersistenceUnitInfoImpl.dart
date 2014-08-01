part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Aug 23, 2012  05:50:55 PM
// Author: hernichen

/** Informaiton of a persistence unit(database) */
class PersistenceUnitInfoImpl implements PersistenceUnitInfo {
  String _name;
  String _provider;
  ValidationMode _validationMode;
  SharedCacheMode _sharedCacheMode;
  PersistenceUnitTransactionType _txType;

  List<String> _classes = new List();
  List<String> _files = new List();
  Map _properties = new Map();

  PersistenceUnitInfoImpl(
      this._name, this._txType, this._provider, this._classes,
      this._files, this._sharedCacheMode, this._validationMode,
      this._properties);
  //@Override
  List<String> getManagedClassNames() =>_classes;

  //@Override
  String getPersistenceProviderClassName() => _provider;

  //@Override
  String getPersistenceUnitName() => _name;

  //@Override
  Map getProperties() => _properties;

  //@Override
  SharedCacheMode getSharedCacheMode() => _sharedCacheMode;

  //@Override
  PersistenceUnitTransactionType getTransactionType() => _txType;

  //@Override
  ValidationMode getValidationMode() => _validationMode;

  //-- implementation --//
  void addManagedClasses(List<String> classes) {
    _classes.addAll(classes);
  }
}
