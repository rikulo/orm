//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  06:52:36 PM
// Author: hernichen

class MapAttributeImpl<X,K,V> extends PluralAttributeImpl<X,Map<K,V>,V>
implements MapAttribute<X,K,V> {
  final MetaType<K> _kType;
  final String _mapKey;
  final MapKeyColumn _mkColumn;
  final List<MapKeyJoinColumn> _mkjColumns;
  final TemporalType _mkTemporal;

  MapAttributeImpl(String name, ManagedTypeImpl declaredType,
                        MethodMirror member, ClassMirror cls,
                        bool association, PersistentAttributeType pType,
                        FetchType fetch, List<CascadeType> cascade,
                        String mappedBy, bool orphanRemoval,
                        AccessType access,
                        TemporalType temporal, bool lob,
                        MetaType eType, MetaType kType,
                        String mapKey, MapKeyColumn mkColumn,
                        List<MapKeyJoinColumn> mkjColumns,
                        TemporalType mkTemporal,
                        Column column,
                        List<JoinColumn> jColumns,
                        JoinTable jTable, CollectionTable cTable,
                        String orderBy, OrderColumn oColumn,
                        List<AssociationOverride> assoOverrides,
                        List<AttributeOverride> attrOverrides)
      : this._kType = kType,
        this._mapKey = mapKey,
        this._mkColumn = mkColumn,
        this._mkjColumns = mkjColumns,
        this._mkTemporal = mkTemporal,
        super(name, declaredType, member, cls, association, pType,
          fetch, cascade, mappedBy, orphanRemoval, access, temporal, lob,
          CollectionType.LIST, eType, column, jColumns, jTable, cTable,
          orderBy, oColumn,
          assoOverrides, attrOverrides);

  /** Returns the dart type of the Map key */
  ClassMirror getKeyDartType() => _kType.getDartType();

  /** Returns the type of the Map key of the represented field. */
  MetaType<K> getKeyType() => _kType;
}
