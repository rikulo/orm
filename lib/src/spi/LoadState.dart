part of rikulo_orm_spi;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:17:25 PM
// Author: hernichen

/** Load states returned by the [ProviderUtil]. */
enum LoadState {
  /** The element has been loaded */
  LOADED,
  /** The element has not been loaded */
  NOT_LOADED,
  /** The loading state of the element is unknown */
  UNKNOWN
}
