part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:13:37 PM
// Author: hernichen

class ManagedTypeImpl<X> extends MetaTypeImpl<X> implements ManagedType<X> {
  Map<String, SingularAttribute<X,dynamic>> _singularAttrs;
  Map<String, CollectionAttribute<X,dynamic>> _collectionAttrs;
  Map<String, ListAttribute<X,dynamic>> _listAttrs;
  Map<String, SetAttribute<X,dynamic>> _setAttrs;
  Map<String, QueueAttribute<X,dynamic>> _queueAttrs;
  Map<String, MapAttribute<X,dynamic,dynamic>> _mapAttrs;

  Set<Attribute<X,dynamic>> _attrVals;
  Set<PluralAttribute<X,dynamic,dynamic>> _pluralVals;
  Set<SingularAttribute<X,dynamic>> _singularVals;
  Set<CollectionAttribute<X,dynamic>> _collectionVals;
  Set<ListAttribute<X,dynamic>> _listVals;
  Set<SetAttribute<X,dynamic>> _setVals;
  Set<QueueAttribute<X,dynamic>> _queueVals;
  Set<MapAttribute<X,dynamic,dynamic>> _mapVals;

  //SQL
  bool _cacheable;
  AccessType _aType;

  ManagedTypeImpl(ClassMirror cls, PersistenceType ptype,
      AccessType aType, bool cacheable,
      MetamodelImpl metamodel)
      : this._cacheable = cacheable,
        this._aType = aType,
        super(cls, ptype, metamodel);

  /** Returns the attribute of the managed type that corresponds to the
   * specified name.
   * + [name] - attribute name
   */
  Attribute<X,dynamic> getAttribute(String name) {
    Attribute<X,dynamic> attr = _getDeclaredAttribute0(name);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getAttribute(name);

    throw new ArgumentError(name);
  }

  /** Returns all attributes of the managed type. */
  Set<Attribute<X,dynamic>> getAttributes() {
    Set<Attribute<X,dynamic>> attrs = new Set.from(getDeclaredAttributes());
    ManagedTypeImpl superType = _getSuperType();
    while (superType != null) {
      attrs.addAll(superType.getDeclaredAttributes());
      superType = superType._getSuperType();
    }
    return attrs;
  }

  /** Returns the collection-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  CollectionAttribute<X,dynamic> getCollection(
      String name, [ClassMirror elementType]) {
    CollectionAttribute<X,dynamic> attr = _getDeclaredCollection0(name, elementType);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getCollection(name, elementType);

    throw new ArgumentError(name);
  }

  /** Returns the attribute declared by the managed type that corresponds to the
   * specified name.
   * + [name] - attribute name
   */
  Attribute<X,dynamic> getDeclaredAttribute(String name) {
    Attribute attr = _getDeclaredAttribute0(name);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  Attribute<X,dynamic> _getDeclaredAttribute0(String name) {
    Attribute attr = _singularAttrs[name];
    if (attr != null) return attr;

    attr = _collectionAttrs[name];
    if (attr != null) return attr;

    attr = _listAttrs[name];
    if (attr != null) return attr;

    attr = _setAttrs[name];
    if (attr != null) return attr;

    attr = _queueAttrs[name];
    if (attr != null) return attr;

    attr = _mapAttrs[name];
    if (attr != null) return attr;

    return null;
  }

  /** Returns all attributes declared by the managed type. */
  Set<Attribute<X,dynamic>> getDeclaredAttributes() {
    if (_attrVals == null) {
      _attrVals = new Set.from(_singularAttrs.values);
      _attrVals.addAll(_collectionAttrs.values);
      _attrVals.addAll(_listAttrs.values);
      _attrVals.addAll(_setAttrs.values);
      _attrVals.addAll(_queueAttrs.values);
      _attrVals.addAll(_mapAttrs.values);
    }
    return _attrVals;
  }

  /** Returns the collection-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  CollectionAttribute<X,dynamic> getDeclaredCollection(String name,
      [ClassMirror elementType]) {
    CollectionAttribute attr = _getDeclaredCollection0(name, elementType);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  CollectionAttribute<X,dynamic> _getDeclaredCollection0(String name,
      [ClassMirror elementType]) {
    CollectionAttribute attr = _collectionAttrs[name];
    if (attr is! CollectionAttribute<X,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getElementType().getDartType(), elementType))
      return null;
    return attr;
  }

  /** Returns the List-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  ListAttribute<X,dynamic> getDeclaredList(
      String name, [ClassMirror elementType]) {
    ListAttribute attr = _getDeclaredList0(name, elementType);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  ListAttribute<X,dynamic> _getDeclaredList0(String name,
      [ClassMirror elementType]) {
    ListAttribute attr = _listAttrs[name];
    if (attr is! ListAttribute<X,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getElementType().getDartType(), elementType))
      return null;
    return attr;
  }

  /** Returns the Queue-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  QueueAttribute<X,dynamic> getDeclaredQueue(
      String name, [ClassMirror elementType]) {
    QueueAttribute attr = _getDeclaredQueue0(name, elementType);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  QueueAttribute<X,dynamic> _getDeclaredQueue0(String name,
      [ClassMirror elementType]) {
    QueueAttribute attr = _queueAttrs[name];
    if (attr is! QueueAttribute<X,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getElementType().getDartType(), elementType))
      return null;
    return attr;
  }

  /** Returns the Map-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [keyType] - optional dart type of the key in Map.
   * + [valueType] - optional dart type of the value in Map.
   */
  MapAttribute<X,dynamic,dynamic> getDeclaredMap(
      String name, [ClassMirror keyType, ClassMirror valueType]) {
    MapAttribute attr = _getDeclaredMap0(name, keyType, valueType);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  MapAttribute<X,dynamic,dynamic> _getDeclaredMap0(
      String name, [ClassMirror keyType, ClassMirror valueType]) {
    MapAttribute attr = _mapAttrs[name];
    if (attr is! MapAttribute<X,dynamic,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getKeyType().getDartType(), keyType)
        || !ClassUtil.isAssignableFrom(attr.getElementType().getDartType(), valueType))
      return null;
    return attr;
  }

  /** Returns the multi-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   */
  Set<PluralAttribute<X,dynamic,dynamic>> getDeclaredPluralAttributes() {
    if (_pluralVals == null) {
      _pluralVals = new Set.from(_collectionAttrs.values);
      _pluralVals.addAll(_listAttrs.values);
      _pluralVals.addAll(_setAttrs.values);
      _pluralVals.addAll(_queueAttrs.values);
      _pluralVals.addAll(_mapAttrs.values);
    }
    return _pluralVals;
  }

  /** Returns the Set-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementTYpe] - optional dart type of the element in collection.
   */
  SetAttribute<X,dynamic> getDeclaredSet(String name,
      [ClassMirror elementType]) {
    SetAttribute attr = _getDeclaredSet0(name, elementType);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  SetAttribute<X,dynamic> _getDeclaredSet0(String name,
      [ClassMirror elementType]) {
    SetAttribute attr = _setAttrs[name];
    if (attr is! SetAttribute<X,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getElementType().getDartType(), elementType))
      return null;
    return attr;
  }

  /** Returns the single-valued attribute declared by the managed type that
   * corresponds to the specified name and class.
   * + [name] - the name of the represented field.
   * + [type] - the dart type of the represented field.
   */
  SingularAttribute<X,dynamic> getDeclaredSingularAttribute(
      String name, [ClassMirror type]) {
    SingularAttribute attr = _getDeclaredSingular0(name, type);
    if (attr == null)
      throw new ArgumentError(name);
    return attr;
  }
  SingularAttribute<X,dynamic> _getDeclaredSingular0(String name,
      [ClassMirror type]) {
    SingularAttribute attr = _singularAttrs[name];
    if (attr is! SingularAttribute<X,dynamic>)
      return null;
    if (!ClassUtil.isAssignableFrom(attr.getDartType(), type))
      return null;
    return attr;
  }

  /** Returns the single-valued attributes declared by the managed type.
   */
  Set<SingularAttribute<X,dynamic>> getDeclaredSingularAttributes() {
    if (_singularVals == null)
      _singularVals = new Set.from(_singularAttrs.values);
    return _singularVals;
  }

  /** Returns the List-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  ListAttribute<X,dynamic> getList(String name, [ClassMirror elementType]) {
    ListAttribute<X,dynamic> attr = _getDeclaredList0(name, elementType);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getList(name, elementType);

    throw new ArgumentError(name);
  }

  /** Returns the Queue-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  QueueAttribute<X,dynamic> getQueue(String name, [ClassMirror elementType]) {
    QueueAttribute<X,dynamic> attr = _getDeclaredQueue0(name, elementType);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getQueue(name, elementType);

    throw new ArgumentError(name);
  }

  /** Returns the Map-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [keyType] - optional dart type of the key in Map.
   * + [valueType] - optional dart type of the value in Map.
   */
  MapAttribute<X,dynamic,dynamic> getMap(
      String name, [ClassMirror keyType, ClassMirror valueType]) {
    MapAttribute<X,dynamic,dynamic> attr = _getDeclaredMap0(name, keyType, valueType);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getMap(name, keyType, valueType);

    throw new ArgumentError(name);
  }

  /** Returns the multi-valued attribute of the managed type.
   */
  Set<PluralAttribute<X,dynamic,dynamic>> getPluralAttributes() {
    Set<PluralAttribute<X,dynamic,dynamic>> attrs
      = new Set.from(getDeclaredPluralAttributes());
    ManagedTypeImpl superType = _getSuperType();
    while (superType != null) {
      attrs.addAll(superType.getDeclaredPluralAttributes());
      superType = superType._getSuperType();
    }
    return attrs;
  }

  /** Returns the Set-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  SetAttribute<X,dynamic> getSet(String name, [ClassMirror elementType]) {
    SetAttribute<X,dynamic> attr = _getDeclaredSet0(name, elementType);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getSet(name, elementType);

    throw new ArgumentError(name);
  }

  /** Returns the single-valued attribute of the managed type that
   * corresponds to the specified name and class.
   * + [name] - the name of the represented field.
   * + [type] - the dart type of the represented field.
   */
  SingularAttribute<X,dynamic> getSingularAttribute(
      String name, [ClassMirror type]) {
    SingularAttribute<X,dynamic> attr = _getDeclaredSingular0(name, type);
    if (attr != null) return attr;

    ManagedTypeImpl superType = _getSuperType();
    if (superType != null)
      return superType.getSingularAttribute(name, type);

    throw new ArgumentError(name);
  }

  /** Returns the single-valued attributes of the managed type.
   */
  Set<SingularAttribute<X,dynamic>> getSingularAttributes() {
    Set<SingularAttribute<X,dynamic>> attrs
      = new Set.from(getDeclaredSingularAttributes());
    ManagedTypeImpl superType = _getSuperType();
    while (superType != null) {
      attrs.addAll(superType.getDeclaredSingularAttributes());
      superType = superType._getSuperType();
    }
    return attrs;
  }
}
