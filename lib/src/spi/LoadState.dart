part of rikulo_orm_spi;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:17:25 PM
// Author: hernichen

/** Load states returned by the [ProviderUtil]. */
class LoadState extends Enum {
  /** The element has been loaded */
  static const LoadState LOADED = const LoadState("LOADED");
  /** The element has not been loaded */
  static const LoadState NOT_LOADED = const LoadState("NOT_LOADED");
  /** The loading state of the element is unknown */
  static const LoadState UNKNOWN = const LoadState("UNKNOWN");

  const LoadState(String name) : super(name);
}
