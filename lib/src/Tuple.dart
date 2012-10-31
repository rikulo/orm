//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  12:44:28 PM
// Author: hernichen

/** Extracting the elements of a query result tuple. */
abstract class Tuple {
  /** Returns the value of the element at the specified position in the result
   * tuple as the instance of the optionally specified class .
   */
  getByPosition(int position, [ClassMirror type]);

  /** Returns the value of the element to which the specified alias has been
   * assigned in the result tuple as the instance of the optionally specified
   * class .
   */
  getByAlias(String alias, [ClassMirror type]);

  /** Returns the value of the specified tuple element */
  getValue(TupleElement tupleElement);

  /** Return all tuple elements in this tuple */
  List<TupleElement> getElements();

  /** Returns all values of the result [TupleElement]s as an array */
  List toArray();
}
