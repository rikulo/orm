//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  1:33:44 PM
// Author: hernichen

/** Parameter used in Query.
 *  + [T] - the type of this parameter.
 */
abstract class Parameter<T> {
  /** Returns the parameter name, null if not a named parameter. */
  String getName();

  /** Returns the class name of the dart type of the parameter */
  ClassMirror getParameterType();

  /** Returns the parameter position, null if not a positional parameter */
  int getPosition();
}
