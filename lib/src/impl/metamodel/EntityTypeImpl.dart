part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  04:51:17 PM
// Author: hernichen

class EntityTypeImpl<X> extends IdentifiableTypeImpl<X> implements EntityType<X> {
  final Symbol _name;

  //SQL
  final Table _table; //@Table
  final InheritanceType _inheritance;
  final DiscriminatorColumn _dColumn;
  final DiscriminatorValue _dValue;
  final List<AssociationOverride> _assoOverrides;
  final List<AttributeOverride> _attrOverrides;
  final List<PrimaryKeyJoinColumn> _pkjColumns;

  EntityTypeImpl(this._name,
      ClassMirror cls,
      this._table,
      AccessType aType,
      bool cacheable,
      this._inheritance,
      this._dColumn,
      this._dValue,
      this._pkjColumns,
      bool excludeDefaultListeners,
      bool excludeSuperListeners,
      ClassMirror idClass,
      this._assoOverrides,
      this._attrOverrides,
      MetamodelImpl metamodel)
      : super(cls,
          PersistenceType.ENTITY,
          aType, cacheable,
          excludeDefaultListeners,
          excludeSuperListeners,
          idClass, metamodel);

  Symbol getName() => this._name;

  //-- Bindable --//
  /** Returns the dart class of the represented object. */
  ClassMirror get bindableDartType => getDartType();

  /** Returns the bindable type of the represented object */
  BindableType get bindableType => BindableType.ENTITY_TYPE;

  //-- implementation --//
  String _getTableName()
    => _table != null && _table.name != null ? _table.name : _name;
}
