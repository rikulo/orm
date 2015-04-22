part of rikulo_orm_metamodel;
/*
 * Copyright (c) 2008, 2009, 2011 Oracle, Inc. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse License v1.0 and Eclipse Distribution License v. 1.0
 * which accompanies this distribution.  The Eclipse License is available
 * at http://www.eclipse.org/legal/epl-v10.html and the Eclipse Distribution License
 * is available at http://www.eclipse.org/org/documents/edl-v10.php.
 */

/**
 * Provides access to the metamodel of persistent
 * entities in the persistence unit.
 *
 * @since Java Persistence 2.0
 */
abstract class Metamodel<X> {
  /**
   * Return the metamodel entity type representing the entity.
   *
   * @param cls the type of the represented entity
   *
   * @return the metamodel entity type
   *
   * @throws IllegalArgumentException if not an entity
   */
  EntityType<X> entity(ClassMirror cls);

  /**
   * Return the metamodel managed type representing the
   * entity, mapped superclass, or embeddable class.
   *
   * @param cls the type of the represented managed class
   *
   * @return the metamodel managed type
   *
   * @throws IllegalArgumentException if not a managed class
   */
  ManagedType<X> managedType(ClassMirror cls);

  /**
   * Return the metamodel embeddable type representing the
   * embeddable class.
   *
   * @param cls the type of the represented embeddable class
   *
   * @return the metamodel embeddable type
   *
   * @throws IllegalArgumentException if not an embeddable class
   */
  EmbeddableType<X> embeddable(ClassMirror cls);

  /**
   * Return the metamodel managed types.
   *
   * @return the metamodel managed types
   */
  Set<ManagedType<dynamic>> getManagedTypes();

  /**
   * Return the metamodel entity types.
   *
   * @return the metamodel entity types
   */
  Set<EntityType<dynamic>> getEntities();

  /**
   * Return the metamodel embeddable types.  Returns empty set
   * if there are no embeddable types.
   *
   * @return the metamodel embeddable types
   */
  Set<EmbeddableType<dynamic>> getEmbeddables();
}
