//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  04:37:34 PM
// Author: hernichen

/** Query roots that refer to entities */
abstract class QueryPath<X> extends Expression<X> {
  /** Create a path corresponding to the referenced map-valued attribute.*/
  Expression<Map> getMapPath(MapAttribute<X,dynamic,dynamic> map);

  /** Create a path corresponding to the referenced collection-valued attribute. */
  Expression<Collection> getPluralPath(
      PluralAttribute<X,Collection<dynamic>,dynamic> collection);

  /** Create a path corresponding to the referenced single-valued attribute. */
  QueryPath getSingularPath(SingularAttribute<X,dynamic> attribute);

  /** Create a path corresponding to the referenced attribute */
  QueryPath getAttributePath(String attributeName);

  /** Returns the bindable object that corresponding to this path */
  Bindable<X> getModel();

  /** Returns the parent "node" in the path; null if no parent */
  QueryPath getParentPath();

  /** Create an expression corresponding to the type of this path */
  Expression<ClassMirror> type();
}
