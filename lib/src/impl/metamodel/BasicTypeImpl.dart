part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:16:25 PM
// Author: hernichen

class BasicTypeImpl<X> extends MetaTypeImpl<X> implements BasicType<X> {
  BasicTypeImpl(ClassMirror cls, MetamodelImpl metamodel)
      : super(cls, PersistenceType.BASIC, metamodel);
}
