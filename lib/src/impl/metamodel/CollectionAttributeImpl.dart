part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  06:52:36 PM
// Author: hernichen

class CollectionAttributeImpl<X,E> extends PluralAttributeImpl<X,List<E>,E>
implements CollectionAttribute<X,E> {

  CollectionAttributeImpl(Symbol name, ManagedTypeImpl declaredType,
                        MethodMirror member, ClassMirror cls,
                        bool association, PersistentAttributeType pType,
                        FetchType fetch, List<CascadeType> cascade,
                        String mappedBy, bool orphanRemoval,
                        AccessType access,
                        TemporalType temporal, bool lob,
                        MetaType eType, Column column,
                        List<JoinColumn> jColumns,
                        JoinTable jTable, CollectionTable cTable,
                        String orderBy, OrderColumn oColumn,
                        List<AssociationOverride> assoOverrides,
                        List<AttributeOverride> attrOverrides)
      : super(name, declaredType, member, cls, association, pType,
          fetch, cascade, mappedBy, orphanRemoval, access, temporal, lob,
          CollectionType.COLLECTION, eType, column, jColumns, jTable, cTable,
          orderBy, oColumn,
          assoOverrides, attrOverrides);
}
