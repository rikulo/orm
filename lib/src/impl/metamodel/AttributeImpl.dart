part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:45:11 PM
// Author: hernichen

class AttributeImpl<X,Y> implements Attribute<X,Y> {
  final String _name;
  final ManagedTypeImpl _declaredType;
  final ClassMirror _dartType;
  final bool _collection;
  final MethodMirror _member;
  final PersistentAttributeType _pType;
  final bool _association;

  //SQL options
  final FetchType _fetch; //@OneToOne @OneToMany @ManyToOne @ManyToMany
  final List<CascadeType> _cascade; //@OneToOne @OneToMany @ManyToOne @ManyToMany
  final String _mappedBy; //field name of the owning side; field of the owning
                          //side point to this side
                          //@OneToOne @OneToMany @ManyToMany
  final bool _orphanRemoval; //@OneToOne @OneToMany
  final AccessType _aType; //@Access
  final Column _column;
  final List<JoinColumn> _joinColumns;
  final JoinTable _joinTable;
  final TemporalType _temporal; //@Temporal
  final bool _lob; //@Lob
  final List<AssociationOverride> assoOverrides;
  final List<AttributeOverride> attrOverrides;

  AttributeImpl(String name, ManagedTypeImpl declaredType,
                MethodMirror member, ClassMirror cls,
                bool association, bool collection,
                PersistentAttributeType pType,
                FetchType fetch, List<CascadeType> cascade,
                String mappedBy, bool orphanRemoval,
                AccessType aType,
                TemporalType temporal,
                bool lob,
                Column column, List<JoinColumn> joinColumns,
                JoinTable joinTable,
                List<AssociationOverride> assoOverrides,
                List<AttributeOverride> attrOverrides)
      : this._name = name,
        this._declaredType = declaredType,
        this._dartType = cls,
        this._pType = pType,
        this._collection = collection,
        this._association = association,
        this._member = member,
        this._fetch = fetch,
        this._cascade = cascade,
        this._mappedBy = mappedBy,
        this._orphanRemoval = orphanRemoval,
        this._column = column,
        this._temporal = temporal,
        this._lob = lob,
        this._aType = aType,
        this._joinColumns = joinColumns,
        this._joinTable = joinTable,
        this.assoOverrides = assoOverrides,
        this.attrOverrides = attrOverrides;

  /** Returns the managed Class where the attribute is declared */
  ManagedType<X> getDeclaringType() => _declaredType;

  /** Returns the member mirror for the represented attribute. */
  MethodMirror getDartMember() => _member;

  /** Returns the class mirror of the represented attribute. */
  ClassMirror getDartType() => _dartType;

  /** Returns the name of the represented attribute. */
  String getName() => _name;

  /** Returns the persistentAttributeType. */
  PersistentAttributeType getPersistentAttributeType() => _pType;

  /** Whether the attribute an association */
  bool isAssociation() => _association;

  /** Whether the attribute an collection-valued; i.e. Collection, Set, List,
   * Map.
   */
  bool isCollection() => _collection;

  //Extra
  String _getColumnName()
    => _column != null && _column.name != null ? _column.name : _name;

  String _getTableName() {
    if (_column != null && _column.table != null)
      return _column.table;
    else if (_declaredType is EntityType) {
      EntityTypeImpl dType = _declaredType;
      return dType._getTableName();
    }
    else if (_declaredType is EmbeddableType) {
      EmbeddableTypeImpl eType = _declaredType;
      return eType._getOwningEntity()._getTableName();
    }
    //table of MappedSuperclass is decided by its subclass, no way to know.
    return null;
  }

  AccessType _getAccessType() {
    AccessType aType = _aType == null ? _declaredType._aType : _aType;
    return aType == null ? AccessType.FIELD : aType;
  }
}
