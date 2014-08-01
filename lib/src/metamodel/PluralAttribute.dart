part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  06:36:43 PM
// Author: hernichen

abstract class PluralAttribute<X,C,E> implements Attribute<X,C>, Bindable<E> {
  /** Returns the collection type */
  CollectionType getCollectionType();

  /** Returns the element type */
  MetaType<E> getElementType();
}
