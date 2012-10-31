//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  07:13:37 PM
// Author: hernichen

/** Object/Relation-DB mapping is maintained here.
 * @See PersistenceProviderImpl
 */
abstract class Metamodel {
  EmbeddableType embeddable(ClassMirror cls);
  EntityType entity(ClassMirror cls);
  ManagedType managedType(ClassMirror cls);

  /** Returns all embedables types. */
  Set<EmbeddableType> getEmbeddables();

  /** Returns all entity types. */
  Set<EntityType> getEntities();

  /** Returns all managed types. */
  Set<ManagedType> getManagedTypes();
}