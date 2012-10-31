//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  12:53:51 PM
// Author: hernichen

class MetaTypeImpl<X> implements MetaType<X> {
  final MetamodelImpl _metamodel;
  final ClassMirror _dartType;
  final PersistenceType _pType;
  final int _hashCode = ++globalHashCode;

  ManagedType _supertype; //cached super type

  MetaTypeImpl(this._dartType, this._pType, this._metamodel);

  /** Returns represented dart class */
  ClassMirror getDartType() => _dartType;

  /** Returns the persistence type. */
  PersistenceType getPersistenceType() => _pType;

  ManagedTypeImpl _getSuperType() {
    if (_supertype != null) return _supertype;

    ClassMirror cls = getDartType();
    while (cls.superclass != null) {
      ManagedType type = _metamodel._getMetaType(cls.superclass);
      if (type != null) return type;
      cls = cls.superclass;
    }
    return null;
  }
}
