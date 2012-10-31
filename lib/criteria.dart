//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 14, 2012  11:27:04 AM
// Author: hernichen
library rikulo_orm_criteria;

import "dart:mirrors";
import "orm.dart";
import "metamodel.dart";

//Interfaces
part "src/criteria/AbstractQuery.dart";
part "src/criteria/CollectionJoin.dart";
part "src/criteria/CompoundSelection.dart";
part "src/criteria/CriteriaBuilder.dart";
part "src/criteria/Case.dart";
part "src/criteria/Coalesce.dart";
part "src/criteria/In.dart";
part "src/criteria/SimpleCase.dart";
part "src/criteria/CriteriaQuery.dart";
part "src/criteria/Expression.dart";
part "src/criteria/Fetch.dart";
part "src/criteria/FetchParent.dart";
part "src/criteria/From.dart";
part "src/criteria/Join.dart";
part "src/criteria/ListJoin.dart";
part "src/criteria/MapJoin.dart";
part "src/criteria/Order.dart";
part "src/criteria/ParameterExpression.dart";
part "src/criteria/QueryPath.dart";
part "src/criteria/PluralJoin.dart";
part "src/criteria/Predicate.dart";
part "src/criteria/Root.dart";
part "src/criteria/Selection.dart";
part "src/criteria/SetJoin.dart";
part "src/criteria/Subquery.dart";

//Enums
part "src/criteria/Trimspec.dart";
part "src/criteria/JoinType.dart";
part "src/criteria/BooleanOperator.dart";