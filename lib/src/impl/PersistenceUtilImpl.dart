part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  11:30:34 AM
// Author: hernichen

class PersistenceUtilImpl implements PersistenceUtil {
  //TODO(henri): read managed information.
  bool isLoaded(var entity, [String attributeName]) {
    throw new ArgumentError("PersistenceUtilImpl#isLoaded");
  }
}
