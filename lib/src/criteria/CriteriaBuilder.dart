//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 22, 2012  10:33:19 AM
// Author: hernichen

part of rikulo_orm_criteria;

/** Builder for creating crtieria queries, compound selections, expressions,
 * predicates, orderings, etc.
 */
abstract class CriteriaBuilder {
  /** Create an expression that returns the absolute value of it argument x. */
  Expression<num> abs(Expression<num> x);

  /** Create an `all` expression on the result of the subquery */
  Expression all(Subquery subquery);

  /** Create a conjunction of the given boolean expressions */
  Predicate and(Expression<bool> x, Expression<bool> y);

  /** Create a conjunction of the given restriction predicates */
  Predicate andRestrictions(List<Predicate> restrictions);

  /** Create an `any` expression on the result of the subquery */
  Expression any(Subquery<dynamic> subquery);

  /** Create an array-valued selection item. */
  CompoundSelection<List> array(List<Selection> selections);

  /** Create an ordering by the ascending value of the expression */
  Order asc(Expression x);

  /** Create an `avg` aggregate expression */
  Expression<double> avg(Expression<num> x);

  /** Create a predicate for testng whether 1st argument is between 2nd and 3rd
   * arguments
   */
  Expression<Comparable> between(Expression<Comparable> v,
      Expression<Comparable> x, Expression<Comparable> y);

  /** Create a coalesce expression */
  Coalesce coalesce();

  /** Create an expression that return null if all of it arguments evaluate to
   * null, and teh value of the 1st non-null arguments otherwise.
   */
  Expression coalesceExpression(Expression x, Expression y);

  /** Create an expression that concatenate two argument strings. */
  Expression<String> concat(Expression<String> x, Expression<String> y);

  /** Create a conjunction(and operation) with zero conjuncts */
  Predicate conjunction();

  /** Create a selection item corresponding to a constructor of the specified
   * dart type.
   */
  CompoundSelection construct(ClassMirror resultType,
                                       List<Selection> selections);

  /** Create a `count` aggregate expression. */
  Expression<int> count(Expression x);

  /** Create a `count distinct` aggregate expression. */
  Expression<int> countDistinct(Expression x);

  /** Create a [CriteriaQuery] */
  CriteriaQuery createQuery();

  /** Create a [CriteriaQuery] with the specified result dart type*/
  CriteriaQuery createQueryWithResultType(ClassMirror resultType);

  /** Create a [CriteriaQuery] that returns a tuple as its result */
  CriteriaQuery<Tuple> createTupleQuery();

  /** Create an expression to return the current date from sql's date column */
  Expression<DateTime> currentDate();

  /** Create an expression to return the current time from sql's time column */
  Expression<DateTime> currentTime();

  /** Create an expression to return the current timestamp from sql's timestamp
   * column
   */
  Expression<DateTime> currentTimestamp();

  /** Create an ordering by the descending value of the argument x */
  Order desc(Expression x);

  /** Create an expreaion that returns the difference between its
   * arguments; i.e. the result of x minus y.
   */
  Expression<num> diff(Expression<num> x, Expression<num> y);

  /** Create a disjunction(or operation) with zero disjuncts. */
  Predicate disjunction();

  /** Create a predicate to test equality of it arguments */
  Predicate equal(Expression x, Expression y);

  /** Create a predicate to test the existence of the result of the specified
   * subquery.
   */
  Predicate exists(Subquery subquery);

  /** Create an expression for the execution of a database function. */
  Expression function(String name,
                               ClassMirror type, List<Expression> args);

  /** Create a predicate to test the number if x >= y. */
  Predicate ge(Expression<num> x, Expression<num> y);

  /** Create a predicate to test the [Comparable] if x > y. */
  Predicate greaterThan(Expression<Comparable> x, Expression<Comparable> y);

  /** Create a predicate to test the [Comparable] if x >= y. */
  Predicate greaterThenOrEqualTo(Expression<Comparable> x, Expression<Comparable> y);

  /** Create a `greatest` aggregate expression for finding the greatest of the
   * values.
   */
  Expression<Comparable> greatest(Expression x);

  /** Create a predicate to test the number if x > y. */
  Predicate gt(Expression<num> x, Expression<num> y);

  /** Create a predicate to test whether given expression is contained in a list
   * of values.
   */
  In inValues(Expression expression);

  /** Create a predicate to test whether the specified collection is empty. */
  Predicate isEmpty(Expression<List> collection);

  /** Create a predicat to test if a false expression. */
  Predicate isFalse(Expression<bool> x);

  /** Create a predicate to test if the given elememt is a member of the
   * specified collection.
   */
  Predicate isMember(Expression elem,
                              Expression<List> collection);

  /** Create a predicate to test if the specified collection expression is not
   * empty.
   */
  Predicate isNotEmpty(Expression collection);

  /** Create a predicate to test if the given element is not a member of the
   * specified collection.
   */
  Predicate isNotMember(Expression elem, Expression collection);

  /** Create a predicate to test if the given expression is not null. */
  Predicate isNotNull(Expression x);

  /** Create a predicate to test if the given expression is null */
  Predicate isNull(Expression x);

  /** Create a predicate to test if the given expression is true */
  Predicate isTrue(Expression<bool> x);

  /** Create an expression that return keys of a map */
  Expression<Set> keys(Map map);

  /** Create a predicate to test the number if x <= y */
  Predicate le(Expression<num> x, Expression<num> y);

  /** Create a `least` aggregate exprssion for finding least of the values. */
  Expression<Comparable> least(Expression<Comparable> x);

  /** Create an exprssion that return the length of the string. */
  Expression<int> length(Expression<String> x);

  /** Create a predicate to test the [Comparable]s if x < y */
  Predicate lessThan(Expression x, Expression y);

  /** Create a predicate to test the [Comparable]s if x <= y */
  Predicate lessThanOrEqualTo(Expression x, Expression y);

  /** Create a predicate to test whether the 1st argument match the given
   * pattern with the optional escapeChar.
   */
  Predicate like(Expression<String> x, Expression<String> pattern,
                          [Expression<String> escapeChar]);

  /** Create a literal expression */
  Expression literal(var value);

  /** Create an expression to locate the position of one string x in another
   * string pattern with the optional from position to start scaning.
   */
  Expression<int> locate(Expression<String> x,
      Expression<String> pattern, [Expression<int> from]);

  /** Create an expression that lower the given string. */
  Expression<String> lower(Expression<String> x);

  /** Create a predicate to test the number if x < y. */
  Predicate lt(Expression<num> x, Expression<num> y);

  /** Create a `max` aggregate expression that return maximum number. */
  Expression<num> max(Expression<num> x);

  /** Create a `min` aggregate expression that return minimum number. */
  Expression<num> min(Expression<num> x);

  /** Create a expression that return the modulus of its arguments. */
  Expression<int> mod(Expression<int> x, Expression<int> y);

  /** Create a expression that return the arithmetic negation of its argument. */
  Expression<num> neg(Expression<num> x);

  /** Create a predicate that return the logic not of its arguments. */
  Predicate not(Expression<bool> restriction);

  /** Create a predicate to test the in-equality of its arguments. */
  Predicate notEqual(Expression x, Expression y);

  /** Create a predicate to test whether the 1st argument NOT match the given
   * pattern with the optional escapeChar.
   */
  Predicate notLike(Expression<String> x, Expression<String> pattern,
                             [Expression<String> escapeChar]);

  /** Create an expression that tests whether its arguments are equal; return
   * null if they are and the value of the 1st exprssion otherwise.
   */
  Expression nullif(Expression x, Expression y);

  /** Create an expression which repesent null of the given dart type. */
  Expression nullLiteral(ClassMirror resultType);

  /** Create a disjunction of the given boolean expressions. */
  Predicate or(Expression<bool> x, Expression<bool> y);

  /** Create a disjunction of the given restriction predicates. */
  Predicate orRestrictions(List<Predicate> restrictions);

  /** Create a parameter expression with the specified dart type and an optional
   * parameter name.
   */
  ParameterExpression parameter(ClassMirror paramType, [String name]);

  /** Create an expression that returns the product of its arguments */
  Expression<num> prod(Expression<num> x, Expression<num> y);

  /** Create an expression that returns the quotient of its arguments */
  Expression<num> quot(Expression<num> x, Expression<num> y);

  /** Create a general case expression */
  Case selectCase();

  /** Create a simple case expression */
  SimpleCase selectSimpleCase(Expression expression);

  /** Create an expression that return the size of the specified collection */
  Expression<int> size(Expression<List> collection);

  /** Create a `some` expression on the result of the specified subquery. */
  Expression some(Subquery subquery);

  /** Create an expression that returnsthe square root of its argument. */
  Expression<double> sqrt(Expression<num> x);

  /** Create an expression for substring extraction */
  Expression<String> substring(Expression<String> x, Expression<int> from, [Expression<int> len]);

  /** Create an expression that returns the sum of its arguments */
  Expression<num> sum(Expression<num> x, Expression<num> y);

  //TODO meaningless in dart
  //Expression<double> sumAsDouble(Expression<double> x);

  //TODO meaningless in dart
  //Expression<int> sumAsLong(Expression<int> x);

  //TODO meaningless in dart
  //Expression<double> toBigDecimal(Expression<num> x);

  //TODO meaningless in dart
  //Expression<int> toBigInteger(Expression<num> x);

  /** Create an expression that cast a num to double. */
  Expression<double> toDouble(Expression<num> x);

  //TODO meaningless in dart
  //Expression<double> toFloat(Expression<num> x);

  /** Create an expression that cast a num to int. */
  Expression<int> toInteger(Expression<num> x);

  //TODO meaningless in dart
  //Expression<int> toLong(Expression<num> x);

  //TODO meaningless in dart
  //Expression<String> toString(Expression<String> character);

  /** Create an expression that trim the spcified character(default to blank)
   * from the string; Trimspec is default to "from both ends of the string *.
   */
  Expression<String> trim(Expression<String> x, [Expression<String> t, Trimspec ts = Trimspec.BOTH]);

  /** Create a tuple-valued selection item. */
  CompoundSelection<Tuple> tuple(List<Selection> selections);

  /** Create an expression that convert string to uppercase. */
  Expression<String> upper(Expression<String> x);

  /** Creaate an expression that returns all values of the specified Map */
  Expression<List> values(Map map);
}
