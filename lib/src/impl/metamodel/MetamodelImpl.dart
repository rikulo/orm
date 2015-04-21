part of rikulo_orm_impl;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:13:37 PM
// Author: hernichen

/** Object/Relation-DB mapping is maintained here.
 * @See PersistenceProviderImpl
 */
class MetamodelImpl implements Metamodel {
  Map<ClassMirror, EmbeddableType> _embeddables = {};
  Map<ClassMirror, EntityType> _entities = {};
  Map<ClassMirror, MappedSuperclassType> _mappedSupers = {};
  Map<ClassMirror, MetaType> _types = {};

  Set<EmbeddableType> _embeddableVals;
  Set<ManagedType> _entityVals;
  Set<ManagedType> _managedVals;

  //SQL
  Map<String, IdGenerator> _generators = {};

  //Queries
  Map<String, NamedQuery> _namedQueries = {};
  Map<String, NamedNativeQuery> _namedNativeQueries = {};

  MetamodelImpl(PersistenceUnitInfo uinfo, OrmInfo oinfo) {
    _initBasicTypes();

    //For all mapped classes in uinfo, create metainfo per specified OrmInfo
    List<String> qnames = uinfo.getManagedClassNames();
    for (String qname in qnames) {
      ClassMirror cls = ClassUtil.forName(qname);
      List/*<Annotation>*/ typeAnnts = oinfo.getTypeAnnotations(qname);
      _handleTypeAnnts(cls, typeAnnts, oinfo);
    }

    //map fields
    getManagedTypes().forEach((mType) {
      Map<String, List/*<Annotation>*/> fieldsAnnts =
          oinfo.getFieldsAnnotations(mType.getDartType().qualifiedName);
      _handleFieldsAnnts(mType, fieldsAnnts);
    });
  }

  //@Override
  EmbeddableType embeddable(ClassMirror cls) {
    EmbeddableType embed = _embeddables[cls];
    if (embed == null)
      throw new ArgumentError("cls");
    return embed;
  }

  //@Override
  EntityType entity(ClassMirror cls) {
    EntityType entity = _entities[cls];
    if (entity == null)
      throw new ArgumentError("cls");
    return entity;
  }

  //@Override
  ManagedType managedType(ClassMirror cls) {
    EntityType entity = _entities[cls];
    if (entity != null)
      return entity;
    EmbeddableType embed = _embeddables[cls];
    if (embed != null)
      return embed;
    MappedSuperclassType mapped = _mappedSupers[cls];
    if (mapped == null)
      throw new ArgumentError("cls");
    return mapped;
  }

  /** Returns all embedables types. */
  //@Override
  Set<EmbeddableType> getEmbeddables() {
    if (_embeddableVals == null)
      _embeddableVals = new Set<EmbeddableType>.from(_embeddables.values);
    return _embeddableVals;
  }

  /** Returns all entity types. */
  //@Override
  Set<EntityType> getEntities() {
    if (_entityVals == null)
      _entityVals = new Set<EntityType>.from(_entities.values);
    return _entityVals;
  }

  /** Returns all managed types. */
  //@Override
  Set<ManagedType> getManagedTypes() {
    if (_managedVals == null) {
      _managedVals = new Set<ManagedType>.from(_embeddables.values);
      _managedVals.addAll(_entities.values);
      _managedVals.addAll(_mappedSupers.values);
    }
    return _managedVals;
  }

  //TODO(henri): not completely implemented yet!
  void _handleTypeAnnts(ClassMirror cls, List/*<Annotation>*/ typeAnnts,
                        OrmInfo oinfo) {

    AccessType aType = AccessType.FIELD; //@Access
    bool cacheable = true;
    InheritanceType inheritance = InheritanceType.SINGLE_TABLE;
    PersistenceType pType;
    ClassMirror idClass;
    Symbol entityName;
    Table table;
    List<AssociationOverride> assoOverrides; //@AssociationOverrides, @AssociationOverride
    List<AttributeOverride> attrOverrides; //@AttributeOverrides, @AttributeOverride
    DiscriminatorColumn dColumn; //@DiscriminatorColumn
    DiscriminatorValue dValue; //@DiscriminatorValue
    List<String> listeners; //@EntityListeners
    bool excludeDefaultListeners = false; //@ExcludeDefaultListeners
    bool excludeSuperListeners = false; //@ExcludeSuperListeners
    List<PrimaryKeyJoinColumn> pkjColumns; //@PrimaryKeyJoinColumns, @PrimaryKeyJoinColumn

    for (/*Annotation*/var annt in typeAnnts) {
      if (annt is Entity) {
        pType = PersistenceType.ENTITY;
        entityName = annt.name;
      }
      else if (annt is Embeddable)
        pType = PersistenceType.EMBEDDABLE;
      else if (annt is MappedSuperclass)
        pType = PersistenceType.MAPPED_SUPERCLASS;
      else if (annt is Access)
        aType = annt.access;
      else if (annt is AssociationOverride)
        assoOverrides = [annt];
      else if (annt is AssociationOverrides)
        assoOverrides = annt.overrides;
      else if (annt is AttributeOverride)
        attrOverrides = [annt];
      else if (annt is AttributeOverrides)
        attrOverrides = annt.overrides;
      else if (annt is Cacheable)
        cacheable = annt.cacheable;
      else if (annt is DiscriminatorColumn)
        dColumn = annt;
      else if (annt is DiscriminatorValue)
        dValue = annt;
      else if (annt is EntityListeners)
        listeners = annt.classes;
      else if (annt is ExcludeDefaultListeners)
        excludeDefaultListeners = true;
      else if (annt is ExcludeSuperclassListeners)
        excludeSuperListeners = true;
      else if (annt is IdClass)
        idClass = ClassUtil.forName(annt.className);
      else if (annt is Inheritance)
        inheritance = annt.strategy;
      else if (annt is NamedNativeQueries) {
        for (NamedNativeQuery query in annt.queries)
          _namedNativeQueries[query.name] = query;
      }
      else if (annt is NamedNativeQuery)
        _namedNativeQueries[annt.name] = annt;
      else if (annt is NamedQueries) {
        for (NamedQuery query in annt.queries)
          _namedQueries[query.name] = query;
      }
      else if (annt is NamedQuery)
        _namedQueries[annt.name] = annt;
      else if (annt is PrimaryKeyJoinColumn)
        pkjColumns = [annt];
      else if (annt is PrimaryKeyJoinColumns)
        pkjColumns = annt.joinColumns;
      else if (annt is SequenceGenerator)
        //TODO(henri): check existing name?
        _generators[annt.name] = new SequenceGeneratorImpl(annt);
      else if (annt is Table)
        table = annt;
      else if (annt is TableGenerator)
        //TODO(henri): check existing name?
        _generators[annt.name] = new TableGeneratorImpl(annt);
      //    PersistenceContext
      //    PersistenceContexts
      //    PersistenceUnit
      //    PersistenceUnits
    }

    createEntity() {
      String tableName;
      String schema;
      String catalog;
      List<UniqueConstraint> uniques;
      if (entityName == null)
        entityName = cls.simpleName;
      _types[cls] =
      _entities[cls]=
      new EntityTypeImpl(entityName, cls, table, aType, cacheable,
          inheritance, dColumn, dValue,
          pkjColumns,
          excludeDefaultListeners, excludeSuperListeners,
          idClass, assoOverrides, attrOverrides, this);
    };

    createEmbeddable() {
      _types[cls] =
      _embeddables[cls] =
      new EmbeddableTypeImpl(cls, aType, cacheable, this);
    };

    createMappedSuperclass() {
      _types[cls] =
      _mappedSupers[cls] =
      new MappedSuperclassTypeImpl(cls, aType, cacheable,
          excludeDefaultListeners, excludeSuperListeners,
          assoOverrides, attrOverrides, this);
    };

    //Per the PersistenceType
    List<Function> typeProcessors =
        [ createEntity, //PersistenceType.ENTITY
          createEmbeddable, //PersistenceType.EMBEDDABLE
          createMappedSuperclass //PersistenceType.MAPPED_SUPERCLASS
        ];

    IdentifiableTypeImpl mType = typeProcessors[pType.index]();

    //register event life cycle method for callback listener classes
    if (listeners != null) {
      listeners.forEach((qname) {
        ClassMirror lcls = ClassUtil.forName(qname);
        _handleListenerAnnts(mType, lcls, oinfo);
      });
    }
  }

  //register event life cycle methods for callback listener class
  void _handleListenerAnnts(mType, ClassMirror lcls, OrmInfo oinfo) {
    Map<String, List/*<Annotation>*/> fieldsAnnts =
        oinfo.getFieldsAnnotations(lcls.qualifiedName);
    lcls.declarations.values.forEach((MethodMirror method) {
      Symbol field = method.simpleName;
      List/*<Annotation>*/ fieldAnnts = fieldsAnnts[field];
      if (fieldAnnts != null && method.isRegularMethod)
        _handleMethodAnnts(mType, method, field, fieldAnnts);
    });
  }

  void _handleFieldsAnnts(ManagedTypeImpl mType,
      Map<String, List/*<Annotation>*/> fieldsAnnts) {
    if (mType is EmbeddableType) {
      mType.getDartType().declarations.values.forEach((MethodMirror method) {
        Symbol field = method.simpleName;
        List/*<Annotation>*/ fieldAnnts = fieldsAnnts[field];
        _handleFieldAnnts(mType, method, field, fieldAnnts);
      });
    } else { //IdentifiableType
      mType.getDartType().declarations.values.forEach((MethodMirror method) {
        Symbol field = method.simpleName;
        List/*<Annotation>*/ fieldAnnts = fieldsAnnts[field];
        if (method.isGetter)
          _handleFieldAnnts(mType, method, field, fieldAnnts);
        else if (fieldAnnts != null && method.isRegularMethod)
          _handleMethodAnnts(mType, method, field, fieldAnnts);
      });
    }
  }

  //register event life cycle methods
  void _handleMethodAnnts(IdentifiableTypeImpl mType, MethodMirror method,
                          Symbol field,List/*<Annotation>*/ fieldAnnts) {
    for (/*Annotation*/var annt in fieldAnnts) {
      if (annt is PostLoad)
        mType._handlePostLoad(method);
      else if (annt is PostPersist)
        mType._handlePostPersist(method);
      else if (annt is PostRemove)
        mType._handlePostRemove(method);
      else if (annt is PostUpdate)
        mType._handlePostUpdate(method);
      else if (annt is PrePersist)
        mType._handlePrePersist(method);
      else if (annt is PreRemove)
        mType._handlePreRemove(method);
      else if (annt is PreUpdate)
        mType._handlePreUpdate(method);
    }
  }

  void _handleFieldAnnts(ManagedTypeImpl mType, MethodMirror getter,
                         Symbol field,List/*<Annotation>*/ fieldAnnts) {
    ClassMirror attrcls
      = ClassUtil.getKeyClassMirror(getter.returnType);

    //try register Enum attribute
    _tryRegisterEnumType(attrcls);

    //PluralAttribute
    CollectionType cType = _collectionType(attrcls);
    bool collection = cType != null;
    bool aMap = cType == CollectionType.MAP;
    MetaType eType;

    //MapAttribute
    MetaType kType;
    String mapKeyAttr; //the field name specified in @MapKey
    MapKeyColumn mkColumn; //column mapping to the map key
    EnumType mkEnumType; //@MapKeyEnumerated
    List<MapKeyJoinColumn> mkjColumns; //@MapKeyJoinColumns, @MapKeyJoinColumn
    TemporalType mkTemporal; //@MapKeyTemporal

    //get kType and eType from generic variable type
    if (collection) {
      List<TypeVariableMirror> tvms = attrcls.typeVariables;
      if (tvms.length == 1)
        eType = _typeVariableType(tvms[0]);
      else if (aMap && tvms.length == 2) {
        eType = _typeVariableType(tvms[1]);
        kType = _typeVariableType(tvms[0]);
      }
    }

    //SingularAttribute
    MetaType attrType = _getMetaType(attrcls);
    bool id = false; //@Id
    bool optional = true;
    bool version = false;

    //Attribute
    Symbol name = field;
    ManagedType declaredType = _getMetaType(mType.getDartType());
    MethodMirror member = getter;
    PersistentAttributeType pType = collection ?
      PersistentAttributeType.ELEMENT_COLLECTION : PersistentAttributeType.BASIC;
    bool association = false;

    //SQL options
    FetchType fetch = FetchType.EAGER;
    List<CascadeType> cascade;
    String mappedBy;
    bool orphanRemoval = false;
    ClassMirror targetEntity;
    Column column;
    TemporalType temporal = TemporalType.TIMESTAMP;
    EnumType enumType = EnumType.ORDINAL;
    GeneratedValue generated;
    AccessType aType = AccessType.FIELD;
    List<JoinColumn> jColumns;
    JoinTable jTable;
    CollectionTable cTable;
    List<AssociationOverride> assoOverrides; //@AssociationOverrides, @AssociationOverride
    List<AttributeOverride> attrOverrides; //@AttributeOverrides, @AttributeOverride
    List<PrimaryKeyJoinColumn> pkjColumns; //@PrimaryKeyJoinColumns, @PrimaryKeyJoinColumn used in @OneToOne association
    String orderBy; //@OrderBy
    OrderColumn oColumn; //@OrderColumn: column that maintains the order(must be int)

    //Control flags
    bool embedded = false; //@Embedded, @EmbeddedId
    String mapsIdAttr; //the field name specified in @MapsId
    bool blob = false; //@Lob

    if (fieldAnnts != null) {
      for (/*Annotation*/var annt in fieldAnnts) {
        if (annt is Access)
          aType = annt.access;
        else if (annt is AssociationOverride)
          assoOverrides = [annt];
        else if (annt is AssociationOverrides)
          assoOverrides = annt.overrides;
        else if (annt is AttributeOverride)
          attrOverrides = [annt];
        else if (annt is AttributeOverrides)
          attrOverrides = annt.overrides;
        else if (annt is Basic)
          pType = PersistentAttributeType.BASIC;
        else if (annt is CollectionTable)
          cTable = annt;
        else if (annt is Column)
          column = annt;
        else if (annt is ElementCollection) {
          pType = PersistentAttributeType.ELEMENT_COLLECTION;
          if (annt.fetch != null)
            fetch = annt.fetch;
          if (annt.targetClass != null)
            eType = _getMetaType(ClassUtil.forName(annt.targetClass));
        }
        else if (annt is Embedded) {
          embedded = true;
          pType = PersistentAttributeType.EMBEDDED;
        }
        else if (annt is EmbeddedId) {
          embedded = true;
          id = true;
          pType = PersistentAttributeType.EMBEDDED;
        }
        else if (annt is Enumerated)
          enumType = annt.enumType;
        else if (annt is GeneratedValue)
          generated = annt;
        else if (annt is Id)
          id = true;
        else if (annt is JoinColumn)
          jColumns = [annt];
        else if (annt is JoinColumns)
          jColumns = annt.joinColumns;
        else if (annt is JoinTable)
          jTable = annt;
        else if (annt is Blob)
          blob = true;
        else if (annt is ManyToMany) {
          association = true;
          pType = PersistentAttributeType.MANY_TO_MANY;
          fetch = annt.fetch;
          cascade = annt.cascade;
          mappedBy = annt.mappedBy;
          targetEntity
            = annt.targetEntity == null ?
                null : ClassUtil.forName(annt.targetEntity);
        }
        else if (annt is ManyToOne) {
          association = true;
          pType = PersistentAttributeType.MANY_TO_ONE;
          fetch = annt.fetch;
          cascade = annt.cascade;
          optional= annt.optional;
          targetEntity
            = annt.targetEntity == null ?
                null : ClassUtil.forName(annt.targetEntity);
        }
        else if (annt is OneToMany) {
          association = true;
          pType = PersistentAttributeType.ONE_TO_MANY;
          fetch = annt.fetch;
          cascade = annt.cascade;
          mappedBy = annt.mappedBy;
          orphanRemoval = annt.orphanRemoval;
          targetEntity
            = annt.targetEntity == null ?
                null : ClassUtil.forName(annt.targetEntity);
        }
        else if (annt is OneToOne) {
          association = true;
          pType = PersistentAttributeType.ONE_TO_ONE;
          fetch = annt.fetch;
          cascade = annt.cascade;
          mappedBy = annt.mappedBy;
          optional= annt.optional;
          orphanRemoval = annt.orphanRemoval;
          targetEntity
            = annt.targetEntity == null ?
                null : ClassUtil.forName(annt.targetEntity);
        }
        else if (annt is MapKey) //used with Map whose key is the primary key or field of the entity and the value is the entity itself
          mapKeyAttr = annt.name; //null means use primary key of the referenced value
        else if (annt is MapKeyClass) {
          ClassMirror keyCls = ClassUtil.forName(annt.className);
          _tryRegisterEnumType(keyCls);
          kType = _getMetaType(keyCls);
        }
        else if (annt is  MapKeyColumn) //For those key is Basic type.
          mkColumn = annt;
        else if (annt is MapKeyEnumerated) //For those key is Enum
          mkEnumType = annt.enumType;
        else if (annt is MapKeyJoinColumn)
          mkjColumns = [annt];
        else if (annt is MapKeyJoinColumns)
          mkjColumns = annt.joinColumns;
        else if (annt is MapKeyTemporal)
          mkTemporal= annt.temporal;
        else if (annt is MapsId) //used with @ManyToOne or @OneToOne; specifies a field in Embedded.
          mapsIdAttr = annt.name;
        else if (annt is OrderBy)
          orderBy = annt.orderByList;
        else if (annt is OrderColumn)
          oColumn = annt;
        else if (annt is PrimaryKeyJoinColumn)
          pkjColumns = [annt];
        else if (annt is PrimaryKeyJoinColumns)
          pkjColumns = annt.joinColumns;
        else if (annt is SequenceGenerator)
          //TODO(henri): check existing name?
          _generators[annt.name] = new SequenceGeneratorImpl(annt);
        else if (annt is TableGenerator)
          //TODO(henri): check existing name?
          _generators[annt.name] = new TableGeneratorImpl(annt);
        else if (annt is Temporal)
          temporal = annt.temporal;
        else if (annt is Transient)
          return;
        else if (annt is Version)
          version = true;
//      else if (annt is PersistenceContext)
//      else if (annt is PersistenceUnit)
      }
    }

    if (targetEntity != null) {
      if (collection)
        eType = _getMetaType(targetEntity);
      else {
        attrcls = targetEntity;
        attrType = _getMetaType(attrcls);
      }
    }

    Function createSingular = () {
      mType._singularAttrs[name]
      = new SingularAttributeImpl(name, declaredType,
          member, attrcls, attrType, id, optional, version,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, embedded,
          generated, mapsIdAttr, column, jColumns,
          jTable, pkjColumns,
          assoOverrides, attrOverrides);
    };

    Function createCollection = () {
      mType._collectionAttrs[name]
      = new CollectionAttributeImpl(name, declaredType,
          member, attrcls,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, eType, column, jColumns,
          jTable, cTable, orderBy, oColumn, assoOverrides, attrOverrides);
    };

    Function createList = () {
      mType._listAttrs[name]
      = new ListAttributeImpl(name, declaredType,
          member, attrcls,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, eType, column, jColumns,
          jTable, cTable, orderBy, oColumn, assoOverrides, attrOverrides);
    };

    Function createQueue = () {
      mType._queueAttrs[name]
      = new QueueAttributeImpl(name, declaredType,
          member, attrcls,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, eType, column, jColumns,
          jTable, cTable, orderBy, oColumn, assoOverrides, attrOverrides);
    };

    Function createSet = () {
      mType._setAttrs[name]
      = new SetAttributeImpl(name, declaredType,
          member, attrcls,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, eType, column, jColumns,
          jTable, cTable, orderBy, oColumn, assoOverrides, attrOverrides);

    };

    Function createMap = () {
      mType._mapAttrs[name]
      = new MapAttributeImpl(name, declaredType,
          member, attrcls,
          association, pType,
          fetch, cascade,
          mappedBy, orphanRemoval, aType,
          temporal, blob, eType,
          kType, mapKeyAttr, mkColumn, mkjColumns, mkTemporal,
          column, jColumns,
          jTable, cTable, orderBy, oColumn, assoOverrides, attrOverrides);
    };

    //per the CollectionType
    List<Function> pluralAttrsProcessors =
        [ createCollection, //CollectionType.COLLECTION
          createList, //CollectionType.LIST
          createMap, //CollectionType.MAP
          createSet, //CollectionType.SET
          createQueue //CollectionType.QUEUE
        ];
    Function createPlural = () => pluralAttrsProcessors[cType.index]();

    //per the PeristentAttributeType
    List<Function> attrProcessors  =
        [ createSingular, //PeristentAttributeType.BASIC
          createPlural, //PeristentAttributeType.ELEMENT_COLLECTION
          createSingular, //PeristentAttributeType.EMBEDDED
          createPlural, //PeristentAttributeType.MANY_TO_MANY
          createSingular, //PeristentAttributeType.MANY_TO_ONE
          createPlural, //PeristentAttributeType.ONE_TO_MANY
          createSingular //PeristentAttributeType.ONE_TO_ONE
        ];
    //process Attribute
    attrProcessors[pType.index]();
  }

  void _initBasicTypes() {
    _types[BOOL_MIRROR] = new BasicTypeImpl(BOOL_MIRROR, this);
    _types[NUM_MIRROR] = new BasicTypeImpl(NUM_MIRROR, this);
    _types[INT_MIRROR] = new BasicTypeImpl(INT_MIRROR, this);
    _types[DOUBLE_MIRROR] = new BasicTypeImpl(DOUBLE_MIRROR, this);
    _types[DATE_TIME_MIRROR] = new BasicTypeImpl(DATE_TIME_MIRROR, this);
    _types[STRING_MIRROR] = new BasicTypeImpl(STRING_MIRROR, this);
  }

  CollectionType _collectionType(ClassMirror attrcls) {
    if (ClassUtil.isAssignableFrom(MAP_MIRROR, attrcls))
      return CollectionType.MAP;

    if (ClassUtil.isAssignableFrom(LIST_MIRROR, attrcls))
      return CollectionType.LIST;

    if (ClassUtil.isAssignableFrom(SET_MIRROR, attrcls))
      return CollectionType.SET;

    if (ClassUtil.isAssignableFrom(QUEUE_MIRROR, attrcls))
      return CollectionType.QUEUE;

//    if (ClassUtil.isAssignableFrom(COLLECTION_MIRROR, attrcls))
//      return CollectionType.COLLECTION;

    return null;
  }

  MetaType _typeVariableType(TypeVariableMirror tvm) {
    ClassMirror cls = ClassUtil.getElementClassMirror(tvm.upperBound);
    _tryRegisterEnumType(cls);
    return _getMetaType(cls);
  }

  void _tryRegisterEnumType(ClassMirror cls) {
//    if (ClassUtil.isAssignableFrom(ENUM_MIRROR, cls))
//      _types[cls] = new BasicTypeImpl(cls, this);
  }

  MetaType _getMetaType(ClassMirror cls) => _types[cls];
}