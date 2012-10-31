//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 13, 2012  10:57:23 AM
// Author: hernichen

/** State of the entity managed by [EntityManager]. */
class EntityState extends Enum {
  /** Enity has NO persistent identity and NOT associated with persistence context;
   *  i.e. pure dart object.
   */
  static const EntityState NEW = const EntityState("NEW", 0);

  /** Entity with persistent identity and associated with persistence context */
  static const EntityState MANAGED = const EntityState("MANAGED", 1);

  /** Entity with persistent identity and NOT associated with persistence context */
  static const EntityState DETACHED = const EntityState("DETACHED", 2);

  /** Entity with persistent identity and associated with persistence context and
   * scheduled for removal from the data store.
   */
  static const EntityState REMOVED = const EntityState("REMOVED", 3);

  const EntityState(String name, int ordinal) : super(name, ordinal);
}
