//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 31, 2012  05:24:41 PM
// Author: hernichen

class IdentifiableTypeImpl<X> extends ManagedTypeImpl<X>
    implements IdentifiableType<X> {

  final List<SingularAttribute<X,dynamic>> _idAttrs = new List(); //@Id
  final List<SingularAttribute<X,dynamic>> _verAttrs = new List(); //@Version
  ClassMirror _idClass; //@IdClass
  bool _embeddedId = false; //whether the id field is an @EmbeddedId
  bool _excludeDefaultListeners = false; //@ExcludeDefaultListeners
  bool _excludeSuperListeners = false; //@ExcludeSuperListeners

  List<MethodMirror> _postLoads;
  List<MethodMirror> _postPersists;
  List<MethodMirror> _postRemoves;
  List<MethodMirror> _postUpdates;

  List<MethodMirror> _prePersists;
  List<MethodMirror> _preRemoves;
  List<MethodMirror> _preUpdates;

  Set<SingularAttribute<X,dynamic>> _idAttrVals; //cache of _idAttrs

  IdentifiableTypeImpl(ClassMirror cls, PersistenceType ptype,
      AccessType aType, bool cacheable,
      bool excludeDefaultListeners,
      bool excludeSuperListeners,
      ClassMirror idClass,
      MetamodelImpl metamodel)
      : this._idClass = idClass,
        this._excludeDefaultListeners = excludeDefaultListeners,
        this._excludeSuperListeners = excludeSuperListeners,
        super(cls, ptype, aType, cacheable, metamodel);

  /** Returns the field that corresponds to the id field declared by the
   *  entity or mapped superclass.
   */
  SingularAttribute<X,dynamic> getDeclaredId(ClassMirror type) {
    if (_idClass != null)
      throw const IllegalArgumentException(type);
    SingularAttribute<X,dynamic> idAttr = _getDeclaredId0(type);
    if (idAttr == null)
      throw const IllegalArgumentException(type);
    return idAttr;
  }
  SingularAttribute<X,dynamic> _getDeclaredId0(ClassMirror type) {
    for (SingularAttribute<X,dynamic> idAttr in _idAttrs)
      if (idAttr.getDartType() == type)
        return idAttr;
    return null;
  }

  /** Returns the attribute that corresponds to the version field declared by
   * the entity of mapped superclass.
   */
  SingularAttribute<X,dynamic> getDeclaredVersion(ClassMirror type) {
    SingularAttribute<X,dynamic> verAttr = _getDeclaredVersion0(type);
    if (verAttr == null)
      throw const IllegalArgumentException(type);
    return verAttr;
  }
  SingularAttribute<X,dynamic> _getDeclaredVersion0(ClassMirror type) {
    for (SingularAttribute<X,dynamic> verAttr in _verAttrs)
      if (verAttr.getDartType() == type)
        return verAttr;
    return null;
  }

  /** Returns the attribute that corresponds to the id field of the entity or
   * mapped superclass.
   */
  SingularAttribute<X,dynamic> getId(ClassMirror type) {
    SingularAttribute idAttr = _getDeclaredId0(type);
    if (idAttr != null)
      return idAttr;
    else if (_idClass == null){
      IdentifiableType superIdent = getSupertype();
      if (superIdent != null)
        return superIdent.getId(type);
    }
    throw const IllegalArgumentException(type);
  }

  /** Returns the attributes that corresponding to the id classes */
  Set<SingularAttribute<X,dynamic>> getIdClassAttributes() {
    if (_idAttrVals == null)
      _idAttrVals = new Set.from(_idAttrs);
    return _idAttrVals;
  }

  /** Returns the type that represent the type of the id */
  MetaType getIdType() => _idClass != null ?
      _metamodel._getMetaType(_idClass) : _idAttrs[0].getType();

  /** Returns the identificable type that corresponds to the most specific
   * MappedSuperclass or Entity extended by the Entity or MappedSuperclass.
   */
  IdentifiableType getSupertype() {
    ManagedTypeImpl supertype = _getSuperType();
    while (supertype != null && supertype is! IdentifiableType<X>) {
      supertype = supertype._getSuperType();
    }
    return supertype as IdentifiableType<X>;
  }

  /** Returns the attribute that corresponds to the version field. */
  SingularAttribute getVersion(ClassMirror type) {
    SingularAttribute verAttr = _getDeclaredVersion0(type);
    if (verAttr != null)
      return verAttr;
    else {
      IdentifiableType superIdent = getSupertype();
      if (superIdent != null)
        return superIdent.getVersion(type);
    }
    throw const IllegalArgumentException(type);
  }

  /** Returns wheather the identifiable type has a single id field. */
  bool hasSingleIdAttribute() => _idAttrs.length == 1;

  /** Returns wheather the identifiable type has a version field. */
  bool hasVersionAttribute() => !_verAttrs.isEmpty;

  //extra
  void _handleIdAttr(SingularAttributeImpl attr) {
    if (attr.isId()) {
      if (attr.isEmbedded()) { //@EmbeddedId
        if (!_idAttrs.isEmpty)
          throw const PersistenceException("Cannot define both @EmbeddedId and @Id in an Entity");
        if (_idClass != null)
          throw const PersistenceException("Cannot define both @EmbeddedId and @IdClass in an Entity");
        _embeddedId = true;
        _idClass = attr.getDartType();
      }
      _idAttrs.add(attr);
    }
  }

  void _handleVerAttr(SingularAttributeImpl attr) {
    if (attr.isVersion()) _verAttrs.add(attr);
  }

  void _handlePostLoad(MethodMirror method) {
    _postLoads.add(method);
  }

  void _handlePostPersist(MethodMirror method) {
    _postPersists.add(method);
  }

  void _handlePostRemove(MethodMirror method) {
    _postRemoves.add(method);
  }

  void _handlePostUpdate(MethodMirror method) {
    _postUpdates.add(method);
  }

  void _handlePrePersist(MethodMirror method) {
    _prePersists.add(method);
  }

  void _handlePreRemove(MethodMirror method) {
    _preRemoves.add(method);
  }

  void _handlePreUpdate(MethodMirror method) {
    _preUpdates.add(method);
  }
}
