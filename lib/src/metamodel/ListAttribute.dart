//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  05:12:49 PM
// Author: hernichen

/** Represents dart List-valued attributes.
 *  + [X] - the type of the represented [List] belongs to.
 *  + [E] - the element type of the represented [List].
 */
abstract class ListAttribute<X,E> extends PluralAttribute<X,List<E>,E> {}
