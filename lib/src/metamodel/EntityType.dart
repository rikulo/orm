part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  05:36:11 PM
// Author: hernichen

/** Represents entity type.
 *  + [X] - the represented entity type.
 */
abstract class EntityType<X> implements IdentifiableType<X>, Bindable<X> {
  /** Returns entity  name */
  String getName();
}
