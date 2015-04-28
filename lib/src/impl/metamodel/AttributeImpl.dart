part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:45:11 PM
// Author: hernichen

class AttributeImpl<X,Y> implements Attribute<X,Y> {
  final Symbol name;
  final ManagedTypeImpl<X> declaringType;
  final ClassMirror dartType;
  final bool isCollection;
  final MethodMirror dartMember;
  final PersistentAttributeType persistentAttributeType;
  final bool isAssociation;

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

  AttributeImpl(this.name,
          this.declaringType,
          this.dartMember,
          this.dartType,
          this.isCollection,
          this.isAssociation,
          this.persistentAttributeType,
          this._fetch,
          this._cascade,
          this._mappedBy,
          this._orphanRemoval,
          this._aType,
          this._temporal,
          this._lob,
          this._column,
          this._joinColumns,
          this._joinTable,
          this.assoOverrides,
          this.attrOverrides);

  //Extra
  String _getColumnName()
    => _column != null && _column.name != null ? _column.name : name;

  String _getTableName() {
    if (_column != null && _column.table != null)
      return _column.table;
    else if (declaringType is EntityType) {
      EntityTypeImpl dType = declaringType;
      return dType._getTableName();
    }
    else if (declaringType is EmbeddableType) {
      EmbeddableTypeImpl eType = declaringType;
      return eType._getOwningEntity()._getTableName();
    }
    //table of MappedSuperclass is decided by its subclass, no way to know.
    return null;
  }

  AccessType _getAccessType() {
    AccessType aType = _aType == null ? declaringType._aType : _aType;
    return aType == null ? AccessType.FIELD : aType;
  }
}
