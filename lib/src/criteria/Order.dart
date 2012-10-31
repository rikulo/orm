//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  06:38:34 PM
// Author: hernichen

/** Define the ordering on the query results */
abstract class Order {
  /** Returns the expression that is used for ordering */
  Expression getExpression();

  /** Returns whether in ascending ordering */
  bool isAscending();

  /** Reverse the ordering */
  Order reverse();
}
