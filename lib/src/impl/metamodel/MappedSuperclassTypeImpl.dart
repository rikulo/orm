part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  04:51:17 PM
// Author: hernichen

class MappedSuperclassTypeImpl<X> extends IdentifiableTypeImpl<X>
implements MappedSuperclassType<X> {

  MappedSuperclassTypeImpl(ClassMirror cls, AccessType aType,
      bool cacheable,
      bool excludeDefaultListeners, bool excludeSuperListeners,
      List<AssociationOverride> assoOverrides,
      List<AttributeOverride> attrOverrides,
      MetamodelImpl metamodel)
      : super(cls, PersistenceType.MAPPED_SUPERCLASS, aType,
          cacheable, excludeDefaultListeners, excludeSuperListeners,
          /*idClass*/ null, metamodel);
}