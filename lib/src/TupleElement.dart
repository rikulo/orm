//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

part of rikulo_orm;

/** Defines an element extracted from a query result tuple.
 *  + [X] - the type of the element.
 */
abstract class TupleElement<X> {
  /** Returns the alias assigned to the tuple element; null if no alias is
   * assigned
   */
  String getAlias();

  /** Returns the class mirror(i.e. X or subclass of X) of the tuple
   * element
   */
  ClassMirror get dartType;
}
