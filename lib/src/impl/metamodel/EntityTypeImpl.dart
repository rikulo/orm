part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  04:51:17 PM
// Author: hernichen

class EntityTypeImpl<X> extends IdentifiableTypeImpl<X> implements EntityType<X> {
  final String _name;

  //SQL
  final Table _table; //@Table
  final InheritanceType _inheritance;
  final DiscriminatorColumn _dColumn;
  final DiscriminatorValue _dValue;
  final List<AssociationOverride> _assoOverrides;
  final List<AttributeOverride> _attrOverrides;
  final List<PrimaryKeyJoinColumn> _pkjColumns;

  EntityTypeImpl(String name, ClassMirror cls, Table table,
      AccessType aType,
      bool cacheable, InheritanceType inheritance,
      DiscriminatorColumn dColumn,
      DiscriminatorValue dValue,
      List<PrimaryKeyJoinColumn> pkjColumns,
      bool excludeDefaultListeners,
      bool excludeSuperListeners,
      ClassMirror idClass,
      List<AssociationOverride> assoOverrides,
      List<AttributeOverride> attrOverrides,
      MetamodelImpl metamodel)
      : this._name = name,
        this._table = table,
        this._inheritance = inheritance,
        this._dColumn = dColumn, //used if inheritance is SINGLE_TABLE or JOINED
        this._dValue = dValue, //used with dColumn to indicate the entity class
        this._assoOverrides = assoOverrides,
        this._attrOverrides = attrOverrides,
        this._pkjColumns = pkjColumns,
        super(cls, PersistenceType.ENTITY, aType, cacheable,
            excludeDefaultListeners, excludeSuperListeners,
            idClass, metamodel);

  String getName() => this._name;

  //-- Bindable --//
  /** Returns the dart class of the represented object. */
  ClassMirror getBindableDartType() => getDartType();

  /** Returns the bindable type of the represented object */
  BindableType getBindableType() => BindableType.ENTITY_TYPE;

  //-- implementation --//
  String _getTableName()
    => _table != null && _table.name != null ? _table.name : _name;
}
