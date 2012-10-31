//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  04:50:40 PM
// Author: hernichen

/** Used to build coalesce expressions. Evaluate to null if all arguments
 * evaluated to null; or the value of its first non-null argument.
 */
abstract class Coalesce<T> extends Expression<T> {
  /** Add the specified value into the coalesce expression */
  Coalesce<T> value(Expression<T> value);
}
