part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  06:36:43 PM
// Author: hernichen

class PluralAttributeImpl<X,C,E> extends AttributeImpl<X,C>
implements PluralAttribute<X,C,E>, Bindable<E> {
  final MetaType<E> _eType; //element type of the collection
  final CollectionType _cType;
  final CollectionTable _cTable;
  final String _orderBy;
  final OrderColumn _oColumn;

  PluralAttributeImpl(String name, ManagedTypeImpl declaredType,
                        MethodMirror member, ClassMirror cls,
                        bool association, PersistentAttributeType pType,
                        FetchType fetch, List<CascadeType> cascade,
                        String mappedBy, bool orphanRemoval,
                        AccessType aType,
                        TemporalType temporal, bool lob,
                        CollectionType cType, MetaType eType,
                        Column column,
                        List<JoinColumn> jColumns,
                        JoinTable jTable, CollectionTable cTable,
                        String orderBy, OrderColumn oColumn,
                        List<AssociationOverride> assoOverrides,
                        List<AttributeOverride> attrOverrides)
      : this._eType = eType,
        this._cType = cType,
        this._cTable = cTable,
        this._orderBy = orderBy,
        this._oColumn = oColumn,
        super(name, declaredType, member, cls,
          association, true, pType, fetch, cascade, mappedBy,
          orphanRemoval, aType, temporal, lob, column,
          jColumns, jTable, assoOverrides, attrOverrides);

  //-- PluralAttribute --//
  /** Returns the collection type */
  CollectionType getCollectionType() => _cType;

  /** Returns the element type */
  MetaType<E> getElementType() => _eType;

  //-- Bindable --//
  /** Returns the dart class of the element. */
  ClassMirror getBindableDartType() => _eType.getDartType();

  /** Returns the bindable type of the represented object */
  BindableType getBindableType() => BindableType.PLURAL_ATTRIBUTE;
}
