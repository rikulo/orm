//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  04:44:35 PM
// Author: hernichen

/** Bindable type. */
class BindableType extends Enum {
  static const BindableType ENTITY_TYPE = const BindableType("ENTITY_TYPE", 0);
  static const BindableType PLURAL_ATTRIBUTE = const BindableType("PLURAL_ATTRIBUTE", 1);
  static const BindableType SINGULAR_ATTRIBUTE = const BindableType("SINGULAR_ATTRIBUTE", 2);

  const BindableType(String name, int ordinal) : super(name, ordinal);
}
