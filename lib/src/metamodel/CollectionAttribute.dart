part of rikulo_orm_metamodel;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  05:10:14 PM
// Author: hernichen

/** Represents dart List-valued attributes.
 *  + [X] - The type of the represented [Collection] belongs to.
 *  + [E] - The element type of the represented [Collection].
 */
abstract class CollectionAttribute<X,E> extends PluralAttribute<X,Iterable<E>,E> {}
