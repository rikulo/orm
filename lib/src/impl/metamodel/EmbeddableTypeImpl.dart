//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  04:53:27 PM
// Author: hernichen

class EmbeddableTypeImpl<X> extends ManagedTypeImpl<X>
implements EmbeddableType<X> {
  EntityTypeImpl _owningEntity;

  EmbeddableTypeImpl(ClassMirror cls, AccessType aType,
      bool cacheable, MetamodelImpl metamodel)
      : super(cls, PersistenceType.EMBEDDABLE, aType, cacheable, metamodel);

  EntityTypeImpl _getOwningEntity() {
    return _owningEntity;
  }
}
