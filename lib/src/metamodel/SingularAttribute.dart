part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:57:31 PM
// Author: hernichen

abstract class SingularAttribute<X,T> implements Attribute<X,T>, Bindable<T> {
  /** Returns the type of the represented attribute. */
  MetaType<T> get type;

  /** Returns whether the attribute an id field. */
  bool get isId;

  /** Returns whether the attribute nullable. */
  bool get isOptional;

  /** Returns whether the attribute a version field. */
  bool get isVersion;
}
