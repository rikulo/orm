part of rikulo_orm;

/**
 * Is used with the [Access] annotation to specify an access
 * type to be applied to an entity class, mapped superclass, or
 * embeddable class, or to a specific attribute of such a class.
 *
 * @since Java Persistence 2.0
 */
enum AccessType {
  FIELD,
  PROPERTY
}

/// Defines the types for primary key generation strategies.
enum GenerationType {
  AUTO,
  IDENTITY,
  SEQUENCE,
  TABLE
}

/// Strategy when fetch referenced entities
enum FetchType {
  EAGER,
  LAZY
}

/// Used to ditinguish the type of the [DiscriminatorColumn].
enum DiscriminatorType {
  CHAR,
  INTEGER,
  STRING
}

/// Flush mode decides when to flush entities into db 
enum FlushModeType {
  /// (default) flushing entity to db at query execution. 
  AUTO,
  /// flushing entity to db at transaction commit. 
  COMMIT
}

/// Denfines mapping for enumerated types. 
enum EnumType {
  ORDINAL,
  STRING
}

/// Transaction mode when the EntityManager starts a transaction 
enum TransactionModeType {
  READ_ONLY,
  READ_WRITE
}

/// Defines the cascadable operations that propagated to referred entity 
enum CascadeType {
  ALL,
  DETACH,
  MERGE,
  PERSIST,
  REFRESH,
  REMOVE
}

/// LockMode of Entity 
enum LockMode {
  NONE,
  OPTIMISTIC,
  OPTIMISTIC_FORCE_INCREMENT,
  PESSIMISTIC_FORCE_INCREMENT,
  PESSIMISTIC_READ,
  PESSIMISTIC_WRITE,
  READ,
  WRITE
}

/** 
 * Specifies whether a transaction-scoped or extended persistence context is
 * used in PersistenceContext.
 */
enum PersistenceContextType {
  EXTENDED,
  TRANSACTION
}

/// Column type for Date class 
enum TemporalType {
  DATE,
  TIME,
  TIMESTAMP
}


/// Defines the types of entity inheritance strategies. 
enum InheritanceType {
  JOINED,
  SINGLE_TABLE,
  TABLE_PER_CLASS
}

enum TransactionType {
  /// JTA entity manager will be created 
  JTA,

  /// Resource-local entity manager will be created 
  RESOURCE_LOCAL
}


/** 
 * How the EntityManager handle 2nd-level cache when read from
 * database(by find or queries).
 */
enum CacheRetrieveMode {
  BYPASS,
  USE
}

/// How the EntityManager handle 2nd-level cache when store into database. 
enum CacheStoreMode {
  BYPASS,
  REFRESH,
  USE
}

/// How the EntityManager handle 2nd-level cache for the persistence unit. 
enum SharedCacheMode {
  ALL,
  DISABLE_SELECTIVE,
  ENABLE_SELECTIVE,
  NONE,
  UNSPECIFIED
}

/// How the EntityManager handle 2nd-level cache for the persistence unit. 
enum ValidationMode {
  AUTO,
  CALLBACK,
  NONE
}

/// State of the entity managed by [EntityManager]. 
enum EntityState {
  /** Enity has NO persistent identity and NOT associated with persistence context;
   *  i.e. pure dart object.
   */
  NEW,

  /// Entity with persistent identity and associated with persistence context 
  MANAGED,

  /// Entity with persistent identity and NOT associated with persistence context 
  DETACHED,

  /** 
   * Entity with persistent identity and associated with persistence context and
   * scheduled for removal from the data store.
   */
  REMOVED
}
