//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:34:10 PM
// Author: hernichen

/** Query roots that refer to entities
 *  + [X] - the entity type referenced by this root.
 */
abstract class Root<X> extends From<X,X> {
  /** Returns the metamodel entity correspoinding to the root */
  EntityType<X> getModel();
}
