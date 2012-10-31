//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 13, 2012  10:57:23 AM
// Author: hernichen

/** State of the entity managed by [EntityManager]. */
class EntityState {
  /** Enity has NO persistent identity and NOT associated with persistence context;
   *  i.e. pure dart object.
   */
  static final int ENTITY_NEW = 0;

  /** Entity with persistent identity and associated with persistence context */
  static final int ENTITY_MANAGED = 1;

  /** Entity with persistent identity and NOT associated with persistence context */
  static final int ENTITY_DETACHED = 2;

  /** Entity with persistent identity and associated with persistence context and
   * scheduled for removal from the data store.
   */
  static final int ENTITY_REMOVED = 3;
}
