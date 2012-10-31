//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  10:55:59 AM
// Author: hernichen

/** Utility used by [PersistenceUtil] to determine the load status of an
 * entity or entity attribute.
 */
interface ProviderUtil {
  /** + Returns [LoadState].LOADED if specified entity and all fields marked as
   * [FetchType].EAGER been loaded.
   *  + Returns [LoadState].NOT_LOADED if specified entity and NOT all fields
   *  marked as [FetchType].EAGER been loaded.
   *  + Returns [LoadState].UNKNOWN if cannot determine.
   *
   *  Note the provider's implementation of this method must not obtain a
   *  reference to an attribute value.
   */
  LoadState isLoaded(var entity);

  /** + Returns [LoadState].LOADED if the specified field of the specified entity
   * has been loaded.
   *  + Returns [LoadState].NOT_LOADED if the specified field of the specified
   *  entity has not been loaded or all fields marked as [FetchType].EAGER
   *  has not been loaded.
   *  + Returns [LoadState].UNKNOWN if cannot determine.
   *
   *  Note the provider's implementation of this method must not obtain a
   *  reference to an attribute value.
   */
  LoadState isLoadedWithoutReference(var Entity, String attributeName);

  /** + Returns [LoadState].LOADED if the specified field of the specified entity
   * has been loaded.
   *  + Returns [LoadState].NOT_LOADED if the specified field of the specified
   *  entity has not been loaded or all fields marked as [FetchType].EAGER
   *  has not been loaded.
   *  + Returns [LoadState].UNKNOWN if cannot determine.
   *
   *  Note the provider's implementation of this method allows to obtain a
   *  reference to an attribute value.
   */
  LoadState isLoadedWithReference(var Entity, String attributeName);
}
