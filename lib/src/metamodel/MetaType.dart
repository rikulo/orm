part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  12:53:51 PM
// Author: hernichen

abstract class MetaType<X> {
  /** Returns represented dart class */
  ClassMirror getDartType();

  /** Returns the persistence type. */
  PersistenceType getPersistenceType();
}
