//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Fri, Aug 17, 2012  10:02:29 AM
// Author: hernichen
//TODO JPA spec. ref http://docs.oracle.com/javaee/6/api/index.html?javax/persistence/Entity.html

/** Marker interface for persistence annotation */
class Annotation {}

/** For field/class: Attribute access type: FIELD | PROPERTY */
//@Target(value:{"FIELD", "TYPE"})
class Access extends Annotation {
  final AccessType access;

  const Access({AccessType access : AccessType.FIELD})
      : this.access = access;
}

/** For field/class: Override mapping for an entity relationship
 * + [name] - name of the relationship field.
 * + [joinColumns] - joinColumns that mapping is defined with a foreign key.
 * + [joinTable] - joinTable that mapping is defined with a join table.
 */
//@Target(value:{"FIELD", "TYPE"})
class AssociationOverride extends Annotation {
  final String name;
  final List<JoinColumn> joinColumns;
  final JoinTable joinTable;

  const AssociationOverride(String name,
      {JoinTable joinTable, List<JoinColumn> joinColumns})
      : this.name = name,
        this.joinTable = joinTable,
        this.joinColumns = joinColumns;
}

/** For field/class: Override mappings for multiple entity relationships.
 */
//@Target(value:{"FIELD", "TYPE"})
class AssociationOverrides extends Annotation {
  final List<AssociationOverride> overrides;

  const AssociationOverrides(List<AssociationOverride> overrides)
      : this.overrides = overrides;
}

/** For field/class: override mapping of a Basic field or a Id field.
 * + [name] - the name of the field to be override
 * + [column] - the column that is being mapped to the field.
 */
//@Target(value:{"FIELD", "TYPE"})
class AttributeOverride extends Annotation {
  final String name;
  final Column column;

  const AttributeOverride(String name, Column column)
      : this.name = name,
        this.column = column;
}

/** For field/class: override mappings of multiple Basic fields or Id fields. */
//@Target(value:{"FIELD", "TYPE"})
class AttributeOverrides extends Annotation {
  final List<AttributeOverride> overrides;

  const AttributeOverrides(List<AttributeOverride> overrides)
      : this.overrides = overrides;
}

/** For field: Simplest mapping of a field to a database column.
 * + [fetch] - fetch type for this field; see [FetchType].
 * + [optional] - whether the value of this field could be null.
 */
//@Target(value:"FIELD")
class Basic extends Annotation {
  final FetchType fetch;
  final bool optional;

  const Basic({FetchType fetch : FetchType.EAGER, bool optional : true})
      : this.fetch = fetch,
        this.optional = optional;
}

/** For class: Specifies whether the entity should be cached.
 * + [cacheable] - whether the entity should be cached.
 */
//@Target(value:"TYPE")
class Cacheable extends Annotation {
  final bool cacheable;

  const Cacheable({bool cacheable : true})
      : this.cacheable = cacheable;
}

/** For field: specified the table used for mapping of collections of basic or
 * embeddable types. Used in collection-valued field.
 *
 * + [name] - table name
 * + [schema] - table schema
 * + [catalog] - table catalog
 * + [joinColumns] - foreign key columns of this table referenced to the primary
 *   table of the entity.
 * + [uniqueConstraint] - uniqueContrains placed on the table
 */
//@Target(value:"FIELD")
class CollectionTable extends Annotation {
  final String catalog;
  final List<JoinColumn> joinColumns;
  final String name;
  final String schema;
  final List<UniqueConstraint> uniqueConstraints;

  const CollectionTable({String name, String schema, String catalog,
      List<JoinColumn> joinColumns, List<UniqueConstraint> uniqueConstraints})
      : this.name = name,
        this.catalog = catalog,
        this.schema = schema,
        this.joinColumns = joinColumns,
        this.uniqueConstraints = uniqueConstraints;
}

/** For field: specified a mapped column.
 * + [name] - the column name; default to field name.
 * + [nullable] - whether the foreign key column nullable
 * + [length] - the column length
 * + [precision] - precision for number column
 * + [scale] - scale for number column
 * + [table] - neme of the table that contains the column
 * + [unique] - whether the field a unique key
 * + [insertable] - whether the column in SQL INSERT statement
 * + [updatable] - whether the column in SQL UPDATE statement
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:"FIELD")
class Column extends Annotation {
  final String name;
  final bool nullable;
  final int length;
  final int precision;
  final int scale;
  final String table;
  final bool unique;
  final bool insertable;
  final bool updatable;
  final String columnDefinition;

  const Column({String name, bool nullable : true, int length : 255,
      int precision : 0, int scale : 0, String table, bool unique : false,
      bool insertable : true, bool updatable : true, String columnDefinition})
      : this.name = name,
        this.nullable = nullable,
        this.length = length,
        this.precision = precision,
        this.scale = scale,
        this.table = table,
        this.unique = unique,
        this.insertable = insertable,
        this.updatable = updatable,
        this.columnDefinition = columnDefinition;
}

/** For class: Used with SqlResultSetMapping. Specifies a column name in a query.
 * + [name] - the column name in the SELECT clause of a SQL query.
 */
class ColumnResult extends Annotation {
  final String name;

  const ColumnResult(String name)
      : this.name = name;
}

/** For class: specifies the descriminator column to distinguish different
 * classes in SINGLE_TABLE and/or JOINED inheritence mapping strategies.
 *
 * DiscriminatorColumn are only specified in the root of entity class hierarchy.
 */
//@Target(value:"TYPE")
class DiscriminatorColumn extends Annotation {
  final String columnDefinition;
  final DiscriminatorType discriminatorType;
  final int length;
  final String name;

  const DiscriminatorColumn({String name : "DTYPE",
      DiscriminatorType discriminatorType : DiscriminatorType.STRING,
      int length : 31, String columnDefinition})
      : this.name = name,
        this.discriminatorType = discriminatorType,
        this.length = length,
        this.columnDefinition = columnDefinition;
}

/** For class: specifies the value to discriminate a specific concret class;
 * used with [DiscriminatorColumn] and applied on each entity class in the
 * entity hierarchy.
 */
//@Target(value:"TYPE")
class DiscriminatorValue extends Annotation {
  final String value;

  const DiscriminatorValue(this.value);
}

/** For field: defines a collection of instances of a [Basic] type or
 * [Embeddable] class. Must specified this if collection is mapped with
 * [CollectionTable].
 *
 * + [fetch] - Whether the collection should be lazily loaded or eagerly loaded.
 * + [targetClass] - The qulified class name of the element of the collection.
 */
//@Target(value:"FIELD")
class ElementCollection extends Annotation {
  final FetchType fetch;
  final String targetClass;

  const ElementCollection(
      {FetchType fetch : FetchType.LAZY, String targetClass})
      : this.fetch = fetch,
        this.targetClass = targetClass;
}

/** For class: define the current class as an instrinsic part of an owning
 * entity and share the identiy of the entity. The Embeddable class are
 * referred by the field mapped with [Embedded]. All persistent properties of
 * the embedded object is mapped to the same database table of the entity.
 */
//@Target(value:"TYPE")
class Embeddable extends Annotation {
  const Embeddable();
}

/** For field: specifies a persistent field of an [Entity] whose
 * value is an [Embeddable] class.
 */
//@Target(value:"FIELD")
class Embedded extends Annotation {
  const Embedded();
}

/** For field: specifies a persistent field of an [Entity] whose
 * value is a composite primary key (which is an [Embeddable] class). Note
 * either only one [Id] or only one [EmbeddedId] can be applied on an
 * [Entity].
 */
//@Target(value:"FIELD")
class EmbeddedId extends Annotation {
  const EmbeddedId();
}

/** For class: define the current class as an entity.
 * + [name] - optional entity name used in [Query]; if omitted, use the simple
 *  class name of the mapped class as the entity name.
 */
//@Target(value:"TYPE")
class Entity extends Annotation {
  final String name;

  const Entity([String name]) :
    this.name = name;
}

/** For class: specifies the callback listeners classes to be used for an
 * entity or mapped superclass.
 */
//@Target(value:"TYPE")
class EntityListeners extends Annotation {
  final List<String> classes;

  const EntityListeners(this.classes);
}

/** For class: used with SQLResultSetMapping. Used to map the SELECT clause of
 * a SQL query to an entity result.
 * + [entityClass] - qualified class name of the entity.
 * + [descriminatorColumn] - column name or alias of  the column in the
 *   SELECT list used to determine the type of the entity instance.
 * + [fields] - Maps columns specified in the SELECT clause to fields of the
 *   entity class.
 */
//@Target(value:"TYPE")
class EntityResult extends Annotation {
  final String entityClass;
  final String descriminatorColumn;
  final List<FieldResult> fields;

  const EntityResult(String entityClass,
      {String descriminatorColumn, List<FieldResult> fields})
      : this.entityClass = entityClass,
        this.descriminatorColumn = descriminatorColumn,
        this.fields = fields;
}

/** For field: specifies a field should be persisted as a enumerated type.
 * + [enumType] - persist with enum name or ordinal.
 */
//@Target(value:"FIELD")
class Enumerated extends Annotation {
  final EnumType enumType;

  const Enumerated({EnumType enumType : EnumType.ORDINAL})
      : this.enumType = enumType;
}

/** For class: specifies the invocation of default listeners is excluded for the
 * [Entity] class(or [MappedSuperclass]) and its subclasses.
 */
//@Target(value:"TYPE")
class ExcludeDefaultListeners extends Annotation {
  const ExcludeDefaultListeners();
}

/** For class: specifies the invocation of superclass listeners is excluded for
 * the [Entity] class(or [MappedSuperclass]) and its subclasses.
 */
//@Target(value:"TYPE")
class ExcludeSuperclassListeners extends Annotation {
  const ExcludeSuperclassListeners();
}

/** For class: used with EntityResult. Mapping the columns in SELECT clause to
 * field of the entity class.
 * + [name] - name of the persistent field.
 * + [column] - name or alias of the column in SELECT clause.
 */
class FieldResult extends Annotation {
  final String name;
  final String column;

  const FieldResult(String name, String column)
      : this.name = name,
        this.column = column;
}

/** For field: specifies primary key generation strategy.
 * + [generator] - the generator name.
 * + [strategy] - Strategy mode used to generate primary key(see
 * [GenerationType]).
 */
//@Target(value:"FIELD")
class GeneratedValue extends Annotation {
  final String generator;
  final GenerationType strategy;

  const GeneratedValue({String generator,
      GenerationType strategy : GenerationType.AUTO})
      : this.generator = generator,
        this.strategy = strategy;
}

/** For field: specifies the primary key of the entity in table. */
//@Target(value:"FIELD")
class Id extends Annotation {
  const Id();
}

/** For class: specifies that the class uses a composite primary key that mapped
 * to multiple properies of the entity.
 * + [type] - the dart type of the composite primary key.
 */
//@Target(value:"TYPE")
class IdClass extends Annotation {
  final String className;

  const IdClass(this.className);
}

/** For class: specifies the inheritance strategy for the entity class
 * hierarchy.
 * + [strategy] - the strategy used for the entity inheritabnce hierarchy.
 * see [InheritanceType].
 */
//@Target(value:"TYPE")
class Inheritance extends Annotation {
  final InheritanceType strategy;

  const Inheritance({InheritanceType strategy : InheritanceType.SINGLE_TABLE})
      : this.strategy = strategy;
}

/** For field: specifies a column for joining an entity or element
 * collection.
 * + [name] - the foreign key name
 * + [nullable] - whether the foreign key column nullable
 * + [referencedColumnName] - name of the column referred by this foreign
 * key column
 * + [table] - neme of the table that contains the column
 * + [unique] - whether the field a unique key
 * + [insertable] - whether the column in SQL INSERT statement
 * + [updatable] - whether the column in SQL UPDATE statement
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:"FIELD")
class JoinColumn extends Annotation {
  final String name;
  final bool nullable;
  final String referencedColumnName;
  final String table;
  final bool unique;
  final bool insertable;
  final bool updatable;
  final String columnDefinition;

  const JoinColumn({String name, bool nullable : true,
      String referencedColumnName, String table, bool unique : false,
      bool insertable : true, bool updatable : true, String columnDefinition})
      : this.name = name,
        this.nullable = nullable,
        this.referencedColumnName = referencedColumnName,
        this.table = table,
        this.unique = unique,
        this.insertable = insertable,
        this.updatable = updatable,
        this.columnDefinition = columnDefinition;
}

/** For field: defines a composite foreigh keys; groups of [joinColumn].
 */
//@Target(value:"FIELD")
class JoinColumns extends Annotation {
  final List<JoinColumn> joinColumns;

  const JoinColumns(this.joinColumns);
}

/** For field: define the mapping association table in
 * owning side; used with [joinColumns].
 * + [name] - table name
 * + [schema] - table schema
 * + [catalog] - table catalog
 * + [joinColumns] - setup joinColumns of JoinTable; see [JoinColumns].
 * + [inverseJoinColumns] - setup inverseJoinColumns of JoinTable; see [JoinColumns].
 * + [uniqueConstraint] - uniqueContrains placed on the table.
 */
//@Target(value:"FIELD")
class JoinTable extends Annotation {
  final String name;
  final String catalog;
  final String schema;
  final List<JoinColumn> joinColumns;
  final List<JoinColumn> inverseJoinColumns;
  final List<UniqueConstraint> uniqueConstraints;

  const JoinTable({String name, String schema, String catalog,
      List<JoinColumn> joinColumns, List<JoinColumn> inverseJoinColumns,
      List<UniqueConstraint> uniqueConstraints})
      : this.name = name,
        this.catalog = catalog,
        this.schema = schema,
        this.joinColumns = joinColumns,
        this.inverseJoinColumns = inverseJoinColumns,
        this.uniqueConstraints = uniqueConstraints;
}

/** For field: specifies a field should be persisted as a large
 * object in database.
 */
//@Target(value:"FIELD")
class Lob extends Annotation {
  const Lob();
}

/** For field: defines a many-to-many association.
 * + [mappedBy] - the feild that owns the relationship
 * + [targetEntity] - the entity class that is the target of the association.
 * + [fetch] - the fetch type; see [FetchType]
 * + [cascade] - the operations specified here shall be cascaded to the
 * other side; see [CascadeType]
 */
//@Target(vlaue="FIELD")
class ManyToMany extends Annotation {
  final String mappedBy;
  final String targetEntity;
  final FetchType fetch;
  final List<CascadeType> cascade;

  const ManyToMany({String mappedBy, String targetEntity,
      FetchType fetch : FetchType.LAZY, List<CascadeType> cascade})
      : this.mappedBy = mappedBy,
        this.targetEntity = targetEntity,
        this.fetch = fetch,
        this.cascade = cascade;
}

/** For field: defines a many-to-one association to another entity.
 * + [optional] - Whether the association is optional (nullable)
 * + [targetEntity] - the entity class that is the target of the association.
 * + [fetch] - the fetch type; see [FetchType]
 * + [cascade] - the operations specified here shall be cascaded to the
 * other side; see [CascadeType]
 */
//@Target(value:"FIELD")
class ManyToOne extends Annotation {
  final bool optional;
  final String targetEntity;
  final FetchType fetch;
  final List<CascadeType> cascade;

  const ManyToOne({bool optional : true, String targetEntity,
      FetchType fetch : FetchType.EAGER, List<CascadeType> cascade})
      : this.optional = optional,
        this.targetEntity = targetEntity,
        this.fetch = fetch,
        this.cascade = cascade;
}

/** For field: specifies the key for association to a Map class. The key is the
 * primary key or unique column of the value table(the other side).
 */
//@Target(value:"FIELD")
class MapKey extends Annotation {
  final String name;

  const MapKey({String name})
      : this.name = name;
}

/** For field: specifies the key type(basic/embeddable/entity) for association
 * to a Map class.
 */
//@Target(value:"FIELD")
class MapKeyClass extends Annotation {
  final String className;

  const MapKeyClass(this.className);
}

/** For field: specifies the mapping for the key column of a [Map] whose key is
 * a basic type.
 * + [name] - the column name; default to field name.
 * + [nullable] - whether the foreign key column nullable
 * + [length] - the column length
 * + [precision] - precision for number column
 * + [scale] - scale for number column
 * + [table] - neme of the table that contains the column
 * + [unique] - whether the field a unique key
 * + [insertable] - whether the column in SQL INSERT statement
 * + [updatable] - whether the column in SQL UPDATE statement
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:"FIELD")
class MapKeyColumn extends Annotation {
  final String name;
  final bool nullable;
  final int length;
  final int precision;
  final int scale;
  final String table;
  final bool unique;
  final bool insertable;
  final bool updatable;
  final String columnDefinition;

  const MapKeyColumn({String name, bool nullable : true, int length : 255,
      int precision : 0, int scale : 0, String table, bool unique : false,
      bool insertable : true, bool updatable : true, String columnDefinition})
      : this.name = name,
        this.nullable = nullable,
        this.length = length,
        this.precision = precision,
        this.scale = scale,
        this.table = table,
        this.unique = unique,
        this.insertable = insertable,
        this.updatable = updatable,
        this.columnDefinition = columnDefinition;
}

/** For field: specifies the enum type for a [Map] key whose basic type is an
 * enumerted type.
 * + [enumType] - persist with enum name or ordinal.
 */
//@Target(value:"FIELD")
class MapKeyEnumerated extends Annotation {
  final EnumType enumType;

  const MapKeyEnumerated({EnumType enumType : EnumType.ORDINAL})
      : this.enumType = enumType;
}

/** For field: specifes a  mapping to an [Entity] that is a [Map] key.
 * + [name] - the foreign key name
 * + [nullable] - whether the foreign key column nullable
 * + [referencedColumnName] - name of the column referred by this foreign
 * key column
 * + [table] - neme of the table that contains the column
 * + [unique] - whether the field a unique key
 * + [insertable] - whether the column in SQL INSERT statement
 * + [updatable] - whether the column in SQL UPDATE statement
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:"FIELD")
class MapKeyJoinColumn extends Annotation {
  final String name;
  final bool nullable;
  final String referencedColumnName;
  final String table;
  final bool unique;
  final bool insertable;
  final bool updatable;
  final String columnDefinition;

  const MapKeyJoinColumn({String name, bool nullable : true,
      String referencedColumnName, String table, bool unique : false,
      bool insertable : true, bool updatable : true, String columnDefinition})
      : this.name = name,
        this.nullable = nullable,
        this.referencedColumnName = referencedColumnName,
        this.table = table,
        this.unique = unique,
        this.insertable = insertable,
        this.updatable = updatable,
        this.columnDefinition = columnDefinition;
}

/** For field: supports composite map keys that reference entities; group of
 * [MapKeyJoinColumn]s.
 */
//@Target(value:"FIELD")
class MapKeyJoinColumns extends Annotation {
  final List<MapKeyJoinColumn> joinColumns;

  const MapKeyJoinColumns(this.joinColumns);
}

/** For field: specifies for [Map] keys of type Date.
 * + [temporalType] - temporal type for mapping for Date class;
 * see [TemporalType].
 */
//@Target(value:"FIELD")
class MapKeyTemporal extends Annotation {
  final TemporalType temporal;

  const MapKeyTemporal(this.temporal);
}

/** For class: specifies a super class to be inherited by an entity */
//@Target(value:"TYPE")
class MappedSuperclass extends Annotation {
  const MappedSuperclass();
}

/** For field: designates a [MonyToOne] or [OneToOne] relationship field that
 * provides the mapping for an [EmbeddedId] primary key, a field within an
 * [EmbeddedId] primary key, or a simple primary key of the parent entity.
 *
 * + [name] - name of the mapped id.
 */
//@Target(value:"FIELD")
class MapsId extends Annotation {
  final String name;

  const MapsId({String name})
      : this.name = name;
}

/** For class: specify multiple native SQL named queries. The query names are
 * scoped to the persistence unit. Can be applied to [Entity] or
 * [MappedSuperclass].
 *
 * + [queries] - Array of [NamedNativeQuery].
 */
//@Target(value:"TYPE")
class NamedNativeQueries extends Annotation {
  final List<NamedNativeQuery> queries;

  const NamedNativeQueries(this.queries);
}

/** For class: species a native SQL named query.  The query names are
 * scoped to the persistence unit. Can be applied to [Entity] or
 * [MappedSuperclass].
 *
 * + [name] - the name used to refer this query with [EntityManager]'s method
 *   that create query objects.
 * + [query] - The SQL query string.
 * + [resultClass] - the dart class of the query result.
 * + [resultSetMapping] - the name of a SqlResultSetMapping as annotated in
 * the same target [Entity] or [MappedSuperclas].
 * + [hints] - query hints and properties.
 */
//@Target(value:"TYPE")
class NamedNativeQuery extends Annotation {
  final String name;
  final String query;
  final List<QueryHint> hints;
  final String resultClass;
  final String resultSetMapping;

  const NamedNativeQuery(this.name, this.query,
      {String resultSetMapping, String resultClass, List<QueryHint> hints})
      : this.hints = hints,
        this.resultClass = resultClass,
        this.resultSetMapping = resultSetMapping;
}

/** For class: specify multiple named object-level queries. The query names are
 * scoped to the persistence unit. Can be applied to [Entity] or
 * [MappedSuperclass].
 *
 * + [queries] - Array of [NamedQuery].
 */
//@Target(value:"TYPE")
class NamedQueries extends Annotation {
  final List<NamedQuery> queries;

  const NamedQueries(this.queries);
}

/** For class: species a named object-level query. The query name are
 * scoped to the persistence unit. Can be applied to [Entity] or
 * [MappedSuperclass].
 *
 * + [name] - the name used to refer this query with [EntityManager]'s method
 *   that create query objects.
 * + [query] - The SQL query string.
 * + [lockMode] - the [LockModeType] when doing query.
 * + [hints] - query hints and properties.
 */
//@Target(value:"TYPE")
class NamedQuery extends Annotation {
  final String name;
  final String query;
  final List<QueryHint> hints;
  final LockModeType lockMode;

  const NamedQuery(this.name, this.query,
      {LockModeType lockMode, List<QueryHint> hints})
      : this.hints = hints,
        this.lockMode = lockMode;
}

/** For field: defines a one-to-many association.
 * + [mappedBy] - the feild that owns the relationship
 * + [targetEntity] - the entity class that is the target of the association.
 * + [fetch] - the fetch type; see [FetchType]
 * + [cascade] - the operations specified here shall be cascaded to the
 * other side; see [CascadeType]
 * + [orphanRemoval] - Whether to apply the remove operation to entities that
 * have been removed from the association and to cascade the "remove" to
 * those entities.
 */
//@Target(value:"FIELD")
class OneToMany extends Annotation {
  final String mappedBy;
  final String targetEntity;
  final FetchType fetch;
  final List<CascadeType> cascade;
  final bool orphanRemoval;

  const OneToMany({String mappedBy, String targetEntity,
      FetchType fetch : FetchType.LAZY,
      List<CascadeType> cascade, bool orphanRemoval : false})
      : this.mappedBy = mappedBy,
        this.targetEntity = targetEntity,
        this.fetch = fetch,
        this.cascade = cascade,
        this.orphanRemoval = orphanRemoval;
}

/** For field: defines a one-to-one association.
 * + [optional] - Whether the association is optional (nullable)
 * + [mappedBy] - the feild that owns the relationship
 * + [targetEntity] - the entity class that is the target of the association.
 * + [fetch] - the fetch type; see [FetchMode]
 * + [cascade] - the operations specified here shall be cascaded to the
 * other side; see [CascadeType]
 * + [orphanRemoval] - Whether to apply the remove operation to entities that
 * have been removed from the association and to cascade the "remove" to
 * those entities.
 */
//@Target(value:"FIELD")
class OneToOne extends Annotation {
  final bool optional;
  final String mappedBy;
  final String targetEntity;
  final FetchType fetch;
  final List<CascadeType> cascade;
  final bool orphanRemoval;

  const OneToOne({bool optional : true, String mappedBy, String targetEntity,
      FetchType fetch : FetchType.EAGER, List<CascadeType> cascade,
      bool orphanRemoval : false})
      : this.optional = optional,
        this.mappedBy = mappedBy,
        this.targetEntity = targetEntity,
        this.fetch = fetch,
        this.cascade = cascade,
        this.orphanRemoval = orphanRemoval;
}

/** For field: specifies the ordering of the fields of a collection valued
 * association.
 *
 * + [orderByList] - List of orderBy fields.
 */
//@Target(value:"FIELD")
class OrderBy extends Annotation {
  final String orderByList;

  const OrderBy({String orderByList})
      : this.orderByList = orderByList;
}

/** For field: specifes a column that is used to maintain the order of a list.
 * With [OneToMany] and [ManyToMany] relationship used on the field that
 * references the collection that is to be ordered.
 *
 * + [name] - the column name; default to field name.
 * + [nullable] - whether the foreign key column nullable
 * + [insertable] - whether the column in SQL INSERT statement
 * + [updatable] - whether the column in SQL UPDATE statement
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:"FIELD")
class OrderColumn extends Annotation {
  final String name;
  final bool nullable;
  final bool insertable;
  final bool updatable;
  final String columnDefinition;

  const OrderColumn({String name, bool nullable : true,
      bool insertable : true, bool updatable : true, String columnDefinition})
      : this.name = name,
        this.nullable = nullable,
        this.insertable = insertable,
        this.updatable = updatable,
        this.columnDefinition = columnDefinition;
}

//class PersistenceContext extends Annotation {
//class PersistenceContexts extends Annotation {
//class PersistenceProperty extends Annotation {
//class PersistenceUnit extends Annotation {
//class PersistenceUnits extends Annotation {

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PostLoad extends Annotation {
  const PostLoad();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PostPersist extends Annotation {
  const PostPersist();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PostRemove extends Annotation {
  const PostRemove();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PostUpdate extends Annotation {
  const PostUpdate();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PrePersist extends Annotation {
  const PrePersist ();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PreRemove extends Annotation {
  const PreRemove();
}

/** For method: specifies callback methods of any [Entity], [MappedSuperclass],
 * or a callback listener class for the corresponding lifecycle event.
 */
//@Target(value:"METHOD")
class PreUpdate extends Annotation {
  const PreUpdate();
}

/** For class/field/method: specifies a primary key column that is used as a
 * foreign key to join to another table.
 *
 * + [name] - the foreign key name
 * + [referencedColumnName] - name of the column referred by this foreign
 * key column
 * + [columnDefinition] - SQL fragment for DDL the column
 */
//@Target(value:{"METHOD","TYPE","FIELD")
class PrimaryKeyJoinColumn extends Annotation {
  final String name;
  final String referencedColumnName;
  final String columnDefinition;

  const PrimaryKeyJoinColumn({String name, String referencedColumnName,
                    String columnDefinition})
      : this.name = name,
        this.referencedColumnName = referencedColumnName,
        this.columnDefinition = columnDefinition;
}

/** For class/field/method: spcifies group of PrimaryKeyJoinColumn for composite
 * foreign keys.
 *
 * + [joinColumns] - group of [PrimaryKeyJoinColumn].
 */
//@Target(value:{"METHOD","TYPE","FIELD")
class PrimaryKeyJoinColumns extends Annotation {
  final List<PrimaryKeyJoinColumn> joinColumns;

  const PrimaryKeyJoinColumns(this.joinColumns);
}

/** Used to supply a query property or hint to the [NamedQuery] and
 * [NamedNativeQuery].
 *
 *  + [name] - name of the hint.
 *  + [value] - value of the hint.
 */
class QueryHint extends Annotation {
  final String name;
  final String value;

  const QueryHint(this.name, this.value);
}

/** For class: specifies a secondary table for the entity class. Used for
 * those entities whose data is stored across multiple tables.
 * + [name] - the table name
 * + [schema] - the schema name
 * + [catalog] - the catalog name
 * + [uniqueConstraints] - unique constraints for this table.
 * + [pkJoinColumns] - columns used to join primary table.
 */
//@Target(value:"TYPE")
class SecondaryTable extends Annotation {
  final String name;
  final String schema;
  final String catalog;
  final List<PrimaryKeyJoinColumn> pkJoinColumns;
  final List<UniqueConstraint> uniqueConstraints;

  const SecondaryTable(String name, {String schema, String catalog,
      List<UniqueConstraint> uniqueConstraints,
      List<PrimaryKeyJoinColumn> pkJoinColumns})
      : this.name = name,
        this.schema = schema,
        this.catalog = catalog,
        this.pkJoinColumns = pkJoinColumns,
        this.uniqueConstraints = uniqueConstraints;
}

/** For class: specifies multiple secndary tables for the entity class. */
//@Target(value:"TYPE")
class SecondaryTables extends Annotation {
  final List<SecondaryTable> tables;

  const SecondaryTables(List<SecondaryTable> tables)
      : this.tables = tables;
}

/** For class/field/method: defines a primary key generator that may be
 * referenced by name when a generator element is specified for the
 * [GeneratedValue] annoation.
 *
 *  + [name] - the name of this generator.
 *  + [allocationSize] - the amount to increment by when allocating sequence
 *    numbers.
 *  + [initialValue] - the initial value from which sequence start generate.
 *  + [sequenceName] - the name of the database sequence object.
 *  + [schema] - the database schema of the genertor.
 *  + [catalog] - the database catalog of the generator.
 */
//@Target(value:{"TYPE","METHOD","FIELD"})
class SequenceGenerator extends Annotation {
  final String name;
  final int allocationSize;
  final String catalog;
  final int initialValue;
  final String schema;
  final String sequenceName;

  const SequenceGenerator(this.name,
      {int allocationSize, int initialValue : 1,
      String sequenceName, String schema, String catalog})
      : this.sequenceName = sequenceName,
        this.catalog = catalog,
        this.schema = schema,
        this.initialValue = initialValue,
        this.allocationSize = allocationSize;
}

/** For class: specifies the mapping of the result of a native SQL query.
 * + [name] - the query result name use to associate with real Query.
 * + [columns] - specifies the result set mapping to scalar values.
 * + [entities] - specifies the result set mapping to entities.
 */
//@Target(value:"TYPE")
class SqlResultSetMapping extends Annotation {
  final String name;
  final List<ColumnResult> columns;
  final List<EntityResult> entities;

  const SqlResultSetMapping(String name, { List<ColumnResult> columns,
      List<EntityResult> entities})
      : this.name = name,
        this.columns = columns,
        this.entities = entities;
}

/** For class: specifies the multiple SQLResultSetMapping for native SQL
 * queries.
 */
//@Target(value:"TYPE")
class SqlResultSetMappings extends Annotation {
  final List<SqlResultSetMapping> mappings;

  const SqlResultSetMappings(List<SqlResultSetMapping> mappings)
      : this.mappings = mappings;
}

/** For class: specifies the primary table for the entity.
 * + [name] - table name
 * + [schema] - table schema
 * + [catalog] - table catalog
 * + [uniqueConstraints] - unique constraints placed on the table.
 */
//@Target(value:"TYPE")
class Table extends Annotation {
  final String name;
  final String catalog;
  final String schema;
  final List<UniqueConstraint> uniqueConstraints;

  const Table({String name, String schema, String catalog,
               List<UniqueConstraint> uniqueConstraints})
      : this.name = name,
        this.catalog = catalog,
        this.schema = schema,
        this.uniqueConstraints = uniqueConstraints;
}

/** For class: defines a primary key generator that maybe referenced by name
 * when a generator element is specified with the [GeneratedValue] annotation;
 * can be specified on [Entity] class or primary key field.
 *
 * + [name] - name of this generator.
 * + [allocationSize] - the amount to increment by when allocating id numbers
 *  from the generator.
 * + [initialValue] - initial value to be used to initialize the initial
 *  column value as specified in [valueColumnName].
 * + [pkColumnName] - name of the primary key column in the table.
 * + [pkColumnValue] - primary key value in the table that distinguishes this
 *   set of generated values from others that might stored in the same table.
 * + [valueColumnName] - name of the colume that stores the last value generated
 * + [table] - the name of the table that stores the generated primary key.
 * + [schema] - database schema of the table.
 * + [catalog] - database catalog of the table.
 */
//@Target(value:{"TYPE","METHOD","FIELD"})
class TableGenerator extends Annotation {
  final String name;
  final int allocationSize;
  final int initialValue;
  final String catalog;
  final String schema;
  final String table;
  final String valueColumnName;
  final String pkColumnName;
  final String pkColumnValue;
  final List<UniqueConstraint> uniqueConstraints;

  const TableGenerator(this.name,
      {int allocationSize : 50, int initialValue : 0,
      String pkColumnName, String pkColumnValue, String valueColumnName,
      String table, String schema, String catalog,
      List<UniqueConstraint> uniqueConstraints})
      : this.allocationSize = allocationSize, this.initialValue = initialValue,
        this.pkColumnName = pkColumnName, this.pkColumnValue = pkColumnValue,
        this.valueColumnName = valueColumnName, this.table = table,
        this.schema = schema, this.catalog = catalog,
        this.uniqueConstraints = uniqueConstraints;
}

/** For field: specifies map to which temporal type in database.
 * + [temporalType] - temporal type to map for Date class; see [TemporalType].
 */
//@Target(value:"FIELD")
class Temporal extends Annotation {
  final TemporalType temporal;

  const Temporal(this.temporal);
}

/** For field: specifies the field is not persistent. */
//@Target(value:"FIELD")
class Transient extends Annotation {
  const Transient();
}

/** For field: defines a unique constraint in generating DDL of
 * the primary table.
 * + [columnNames] - columns that make up the constraint.
 * + [name] - optional constraint name.
 */
//@Target(value:"FIELD")
class UniqueConstraint extends Annotation {
  final List<String> columnNames;
  final String name;

  const UniqueConstraint(List<String> columnNames, {String name})
      : this.columnNames = columnNames,
        this.name = name;
}

/** For field: specifies the field a version property for
 * optimistic locking.
 */
//@Target(value:"FIELD")
class Version extends Annotation {
  const Version();
}