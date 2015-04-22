//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 08, 2012  12:07:31 PM
// Author: hernichen
library rikulo_orm;

import "dart:core";
import "dart:mirrors";
import "dart:async";

import "metamodel.dart";
import "criteria.dart";
import "spi.dart";
import "impl.dart";

//Interfaces
part "src/Cache.dart";
part "src/EntityManager.dart";
part "src/EntityManagerFactory.dart";
part "src/EntityTransaction.dart";
part "src/Parameter.dart";
part "src/PersistenceUnitUtil.dart";
part "src/PersistenceUtil.dart";
part "src/Query.dart";
part "src/Tuple.dart";
part "src/TupleElement.dart";
part "src/TypedQuery.dart";

//Classes
part "src/Persistence.dart";

//Enums
part "src/enums.dart";

//Exceptions
part "src/EntityExistsException.dart";
part "src/EntityNotFoundException.dart";
part "src/LockTimeoutException.dart";
part "src/NonUniqueResultException.dart";
part "src/NoResultException.dart";
part "src/OptimisticLockException.dart";
part "src/PersistenceException.dart";
part "src/PessimisticLockException.dart";
part "src/QueryTimeoutException.dart";
part "src/RollbackException.dart";
part "src/TransactionRequiredException.dart";

//Annotation Types
part 'src/annotations.dart';

//Implememtaions
part "src/PersistenceInfo.dart"; //replace persistence.xml
part "src/OrmInfo.dart"; //replace orm.xml

