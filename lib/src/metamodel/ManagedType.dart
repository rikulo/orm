part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  03:46:25 PM
// Author: hernichen

/** Enity, mapped superclass, embeddable types.
 *  + [X] - the represented type.
 */
abstract class ManagedType<X> extends MetaType<X> {
  /** Returns the attribute of the managed type that corresponds to the
   * specified name.
   * + [name] - attribute name
   */
  Attribute<X,dynamic> getAttribute(String name);

  /** Returns all attributes of the managed type. */
  Set<Attribute<X,dynamic>> getAttributes();

  /** Returns the collection-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  CollectionAttribute<X,dynamic> getCollection(
      String name, [ClassMirror elementType]);

  /** Returns the attribute declared by the managed type that corresponds to the
   * specified name.
   * + [name] - attribute name
   */
  Attribute<X,dynamic> getDeclaredAttribute(String name);

  /** Returns all attributes declared by the managed type. */
  Set<Attribute<X,dynamic>> getDeclaredAttributes();

  /** Returns the collection-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  CollectionAttribute<X,dynamic> getDeclaredCollection(String name,
      [ClassMirror elementType]);

  /** Returns the List-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  ListAttribute<X,dynamic> getDeclaredList(
      String name, [ClassMirror elementType]);

  /** Returns the Queue-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  QueueAttribute<X,dynamic> getDeclaredQueue(
      String name, [ClassMirror elementType]);

  /** Returns the Map-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [keyType] - optional dart type of the key in Map.
   * + [valueType] - optional dart type of the value in Map.
   */
  MapAttribute<X,dynamic,dynamic> getDeclaredMap(
      String name, [ClassMirror keyType, ClassMirror valueType]);

  /** Returns the multi-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   */
  Set<PluralAttribute<X,dynamic,dynamic>> getDeclaredPluralAttributes();

  /** Returns the Set-valued attribute declared by the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementTYpe] - optional dart type of the element in collection.
   */
  SetAttribute<X,dynamic> getDeclaredSet(String name, [ClassMirror elementType]);

  /** Returns the single-valued attribute declared by the managed type that
   * corresponds to the specified name and class.
   * + [name] - the name of the represented field.
   * + [type] - the dart type of the represented field.
   */
  SingularAttribute<X,dynamic> getDeclaredSingularAttribute(
      String name, [ClassMirror type]);

  /** Returns the single-valued attributes declared by the managed type.
   */
  Set<SingularAttribute<X,dynamic>> getDeclaredSingularAttributes();

  /** Returns the List-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  ListAttribute<X,dynamic> getList(String name, [ClassMirror elementType]);

  /** Returns the Queue-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  QueueAttribute<X,dynamic> getQueue(String name, [ClassMirror elementType]);

  /** Returns the Map-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [keyType] - optional dart type of the key in Map.
   * + [valueType] - optional dart type of the value in Map.
   */
  MapAttribute<X,dynamic,dynamic> getMap(
      String name, [ClassMirror keyType, ClassMirror valueType]);

  /** Returns the multi-valued attribute of the managed type.
   */
  Set<PluralAttribute<X,dynamic,dynamic>> getPluralAttributes();

  /** Returns the Set-valued attribute of the managed type that
   * corresponds to the specified name and element class.
   * + [name] - attribute name
   * + [elementType] - optional dart type of the element in collection.
   */
  SetAttribute<X,dynamic> getSet(String name, [ClassMirror elementType]);

  /** Returns the single-valued attribute of the managed type that
   * corresponds to the specified name and class.
   * + [name] - the name of the represented field.
   * + [type] - the dart type of the represented field.
   */
  SingularAttribute<X,dynamic> getSingularAttribute(
      String name, [ClassMirror type]);

  /** Returns the single-valued attributes of the managed type.
   */
  Set<SingularAttribute<X,dynamic>> getSingularAttributes();
}
