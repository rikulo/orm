//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  05:57:31 PM
// Author: hernichen

/** For class: specifies that the class is a metamodel class that represents
 * the entity, mapped superclass, or embeddable class designated by the value
 * element.
 */
//@Target(value:"TYPE")
class StaticMetamodel extends Annotation {
  final String className;

  const StaticMetamodel(this.className);
}