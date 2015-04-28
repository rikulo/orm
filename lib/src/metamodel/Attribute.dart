part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  03:23:45 PM
// Author: hernichen

/** Meta model for the Object-Relational DB mapping.
 * + [X] - the represented type that contains the attribute.
 * + [Y] - the type of the represented attribute.
 */
abstract class Attribute<X,Y> {
  /** Returns the managed Class where the attribute is declared */
  ManagedType<X> get declaringType;

  /** Returns the member mirror for the represented attribute. */
  MethodMirror get dartMember;

  /** Returns the class mirror of the represented attribute. */
  ClassMirror get dartType;

  /** Returns the name of the represented attribute. */
  Symbol get name;

  /** Returns the persistentAttributeType. */
  PersistentAttributeType get persistentAttributeType;

  /** Whether the attribute an association */
  bool get isAssociation;

  /** Whether the attribute an collection-valued; i.e. Collection, Set, List,
   * Map.
   */
  bool get isCollection;
}
