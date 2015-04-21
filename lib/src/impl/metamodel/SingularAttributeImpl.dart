part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:57:31 PM
// Author: hernichen

class SingularAttributeImpl<X,T> extends AttributeImpl<X,T> implements SingularAttribute<X,T>, Bindable<T> {
  final MetaType<T> type;
  final bool isId;
  final bool isOptional;
  final bool isVersion;

  //SQL
  final bool isEmbedded;
  final GeneratedValue _generated;
  final String _mapsId; //the name of the attribute within composite key for @ManyToOne or @OneToOne
  List<PrimaryKeyJoinColumn> _pkjColumns; //@PrimaryKeyJoinColumns, @PrimaryKeyJoinColumn used in @OneToOne associaion

  SingularAttributeImpl(Symbol name, 
      ManagedTypeImpl declaredType,
      MethodMirror member,
      ClassMirror attrCls,
      this.type,
      this.isId,
      this.isOptional,
      this.isVersion,
      bool association,
      PersistentAttributeType pType,
      FetchType fetch,
      List<CascadeType> cascade,
      String mappedBy,
      bool orphanRemoval,
      AccessType aType,
      TemporalType temporal,
      bool lob,
      this.isEmbedded,
      this._generated,
      this._mapsId,
      Column column,
      List<JoinColumn> jColumns,
      JoinTable jTable,
      this._pkjColumns,
      List<AssociationOverride> assoOverrides,
      List<AttributeOverride> attrOverrides)
      : super(name,
          declaredType,
          member,
          attrCls,
          association,
          false,
          pType,
          fetch,
          cascade,
          mappedBy,
          orphanRemoval,
          aType,
          temporal,
          lob,
          column,
          jColumns,
          jTable,
          assoOverrides,
          attrOverrides) {

    if (declaredType is IdentifiableTypeImpl) {
      declaredType._handleIdAttr(this);
      declaredType._handleVerAttr(this);
    }
  }

//  //-- Bindable --//
  /** Returns the dart class of the represented object. */
  ClassMirror get bindableDartType => dartType;

  /** Returns the bindable type of the represented object */
  BindableType get bindableType => BindableType.SINGULAR_ATTRIBUTE;
}
