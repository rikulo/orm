//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 21, 2012  02:41:38 PM
// Author: hernichen

part of rikulo_orm;

/** Query execution.
 * + [X] - query result type.
 */
abstract class Query<X> {
  /** Execute udpate or delete statement */
  Future<int> executeUpdate();

  /** Returns the position of the first result the query was set to
   * retrieve(1-based); null or 0 means no such configuration
   */
  int getFirstResult();

  /** Flush mode used for this query */
  FlushModeType getFlushMode();

  /** Returns hints and associated value used for this Query */
  Map<String, dynamic> getHints();

  /** Returns lock mode for this query */
  LockModeType getLockMode();

  /** Miximum number of results the query was set to retrieve */
  int getMaxResults();

  /** Returns the [Parameter] that corresponding to the position and
   * dart type in this Query.
   */
  Parameter getParameterByPosition(int position, [ClassMirror type]);

  /** Returns the [Parameter] that corresponding to the parameter name and
   * type in this Query.
   */
  Parameter getParameterByName(String name, [ClassMirror type]);

  /** Returns all [Parameter]s of this Query. */
  Set<Parameter> getParameters();

  /** Returns the value bound to the [Parameter]. */
  getParameterValue(Parameter param);

  /** Returns the value bound to the postional [Parameter]. */
  getParameterValueByPosition(int poistion);

  /** Returns the value bound to the named [Parameter]. */
  getParameterValueByName(String name);

  /** Execute a SELECT query and return the query results as a List */
  Future<List> getResultList();

  /** Execute a SELECT query and returns a single result */
  Future getSingleResult();

  /** Returns whether a value has been bound to the parameter */
  bool isBound(Parameter param);

  /** Set the position ofhte first result to retrieve */
  Query<X> setFirstResult(int startPosition);

  /** Set the flush mode type to be used for the query */
  Query<X> setFlushMode(FlushModeType flushMode);

  /** Set a query property or hint */
  Query<X> setHint(String hintName, var value);

  /** Set the lock mode type to be used for the query */
  Query<X> setLockMode(LockModeType lockMode);

  /** Bind a date to a positional [Parameter] as specified SQL temporal type. */
  Query<X> setTemporalParameterByPosition(int position, DateTime value, TemporalType temporalType);

  /** Bind an argument to a postional [Parameter]. */
  Query<X> setParameterByPosition(int position, var value);

  /** Bind a date to a named [Parameter] as specified SQL temporal type. */
  Query<X> setTemporalParameterByName(int position, DateTime value, TemporalType temporalType);

  /** Bind an argument to a named [Parameter]. */
  Query<X> setParameterByName(int position, var value);

  /** Bind a date to the specified [Parameter] as specified SQL temporal type. */
  Query<X> setTemporalParameter(Parameter param, DateTime value, TemporalType temporalType);

  /** Bind an argument to the specified [Parameter]. */
  Query<X> setParameter(Parameter param, var value);

  /** Returns an object of the specified dart type to allow access the provider-specific API */
  unwrap(ClassMirror type);
}
