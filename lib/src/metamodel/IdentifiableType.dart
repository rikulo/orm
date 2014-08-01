part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  05:36:11 PM
// Author: hernichen

/** Represents entity or mapped superclass types.
 *  + [X] - the represented entity or mapped superclass type.
 */
abstract class IdentifiableType<X> extends ManagedType<X> {
  /** Returns the field that corresponds to the id field declared by the
   *  entity or mapped superclass.
   */
  SingularAttribute<X,dynamic> getDeclaredId(ClassMirror type);

  /** Returns the attribute that corresponds to the version field declared by
   * the entity of mapped superclass.
   */
  SingularAttribute<X,dynamic> getDeclaredVersion(ClassMirror type);

  /** Returns the attribute that corresponds to the id field of the entity or
   * mapped superclass.
   */
  SingularAttribute getId(ClassMirror type);

  /** Returns the attributes that corresponding to the id classes */
  Set<SingularAttribute> getIdClassAttributes();

  /** Returns the type that represent the type of the id */
  MetaType getIdType();

  /** Returns the identificable type that corresponds to the most specific
   * mapped superclass or entity extended by the entity or mapped superclass.
   */
  IdentifiableType getSupertype();

  /** Returns the attribute that corresponds to the version field. */
  SingularAttribute getVersion(ClassMirror type);

  /** Returns wheather the identifiable type has a single id field. */
  bool hasSingleIdAttribute();

  /** Returns wheather the identifiable type has a version field. */
  bool hasVersionAttribute();
}
