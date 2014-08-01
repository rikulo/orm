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
part "src/AccessType.dart";
part "src/CacheRetrieveMode.dart";
part "src/CacheStoreMode.dart";
part "src/CascadeType.dart";
part "src/DiscriminatorType.dart";
part "src/EntityState.dart";
part "src/EnumType.dart";
part "src/FetchType.dart";
part "src/FlushModeType.dart";
part "src/GenerationType.dart";
part "src/InheritanceType.dart";
part "src/LockModeType.dart";
part "src/PersistenceContextType.dart";
part "src/PessimisticLockScope.dart";
part "src/SharedCacheMode.dart";
part "src/TemporalType.dart";
part "src/ValidationMode.dart";
part "src/TransactionType.dart"; //so user can specify transaction directly
part "src/TransactionModeType.dart"; //so user can specify transaction mode

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
part "src/Annotation.dart";

//Implememtaions
part "src/Enum.dart";
part "src/PersistenceInfo.dart"; //replace persistence.xml
part "src/OrmInfo.dart"; //replace orm.xml

