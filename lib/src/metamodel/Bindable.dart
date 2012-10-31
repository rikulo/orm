//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:35:25 PM
// Author: hernichen

/** Object or attribute types that can be bound to a [Path].
 *  + [T] - the type of the represented object or attribute.
 */
abstract class Bindable<T> {
  /** Returns the dart class of the represented object. */
  ClassMirror getBindableDartType();

  /** Returns the bindable type of the represented object */
  BindableType getBindableType();
}
