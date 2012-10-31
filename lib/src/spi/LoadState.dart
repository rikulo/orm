//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:17:25 PM
// Author: hernichen

/** Load states returned by the [ProviderUtil]. */
class LoadState extends Enum {
  /** The element has been loaded */
  static final LoadState LOADED = const LoadState("LOADED", 0);
  /** The element has not been loaded */
  static final LoadState NOT_LOADED = const LoadState("NOT_LOADED", 1);
  /** The loading state of the element is unknown */
  static final LoadState UNKNOWN = const LoadState("UNKNOWN", 2);

  const LoadState(String name, int ordinal) : super(name, ordinal);
}
