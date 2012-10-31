//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:02:41 PM
// Author: hernichen

/** Defines an item that is to be returned.
 *  + [X] - the type of the selection item.
 */
abstract class Selection<X> extends TupleElement<X> {
  /** Assigns an alias to the selection item */
  Selection<X> setAlias(String name);

  /** Returns the selection items that composing this selection */
  List<Selection> getCompoundSelectionItems();

  /** Returns whether this selection a compound selection */
  bool isCompoundSelection();
}
