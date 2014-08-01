part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:57:31 PM
// Author: hernichen

class SingularAttributeImpl<X,T> extends AttributeImpl<X,T> implements SingularAttribute<X,T>, Bindable<T> {
  final MetaType<T> _attrType;
  final bool _id;
  final bool _optional;
  final bool _version;

  //SQL
  final bool _embedded;
  final GeneratedValue _generated;
  final String _mapsId; //the name of the attribute within composite key for @ManyToOne or @OneToOne
  List<PrimaryKeyJoinColumn> _pkjColumns; //@PrimaryKeyJoinColumns, @PrimaryKeyJoinColumn used in @OneToOne associaion

  SingularAttributeImpl(String name, ManagedTypeImpl declaredType,
                        MethodMirror member, ClassMirror attrCls,
                        MetaType attrType, bool id, bool optional, bool version,
                        bool association,
                        PersistentAttributeType pType, FetchType fetch,
                        List<CascadeType> cascade, String mappedBy,
                        bool orphanRemoval, AccessType aType,
                        TemporalType temporal,
                        bool lob, bool embedded,
                        GeneratedValue generated,
                        String mapsId,
                        Column column,
                        List<JoinColumn> jColumns, JoinTable jTable,
                        List<PrimaryKeyJoinColumn> pkjColumns,
                        List<AssociationOverride> assoOverrides,
                        List<AttributeOverride> attrOverrides)
      : this._attrType = attrType,
        this._id = id,
        this._optional = optional,
        this._version = version,
        this._embedded = embedded,
        this._generated = generated,
        this._mapsId = mapsId,
        this._pkjColumns = pkjColumns,
        super(name, declaredType, member, attrCls,
          association, false, pType, fetch, cascade, mappedBy,
          orphanRemoval, aType, temporal, lob, column,
          jColumns, jTable, assoOverrides, attrOverrides) {

    if (declaredType is IdentifiableTypeImpl) {
      (declaredType as IdentifiableTypeImpl)._handleIdAttr(this);
      (declaredType as IdentifiableTypeImpl)._handleVerAttr(this);
    }
  }

  //-- SingularAttribute --//
  /** Returns the type of the represented attribute. */
  MetaType<T> getType() => _attrType;

  /** Returns whether the attribute an id field. */
  bool isId() => _id;

  /** Returns whether the attribute nullable. */
  bool isOptional() => _optional;

  /** Returns whether the attribute a version field. */
  bool isVersion() => _version;

  //-- Bindable --//
  /** Returns the dart class of the represented object. */
  ClassMirror getBindableDartType() => getDartType();

  /** Returns the bindable type of the represented object */
  BindableType getBindableType() => BindableType.SINGULAR_ATTRIBUTE;

  //extra
  bool isEmbedded() => _embedded;
}
