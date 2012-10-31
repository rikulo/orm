//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:57:31 PM
// Author: hernichen

abstract class SingularAttribute<X,T> implements Attribute<X,T>, Bindable<T> {
  /** Returns the type of the represented attribute. */
  MetaType<T> getType();

  /** Returns whether the attribute an id field. */
  bool isId();

  /** Returns whether the attribute nullable. */
  bool isOptional();

  /** Returns whether the attribute a version field. */
  bool isVersion();
}
