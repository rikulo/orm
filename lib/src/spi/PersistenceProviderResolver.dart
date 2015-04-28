part of rikulo_orm_spi;

//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Aug 20, 2012  06:41:25 PM
// Author: hernichen

/** Determine the list of persistence providers available in the runtime. Note
 * the getPersistenceProviders() can be call multiple times; maybe you want to
 * cache the instance.
 */
abstract class PersistenceProviderResolver {
  /** Clear the cached providers */
  void clearCachedProviders();

  /** Returns a list of the available [PersistenceProvider]s in the runtime. */
  List<PersistenceProvider> getPersistenceProviders();
}
