//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 29, 2012 07:22:41 PM
// Author: henrichen
library rikulo_orm_impl;

import "dart:core";
import "dart:mirrors";
import "dart:async";
import "dart:collection";
import 'package:rikulo_commons/util.dart';
import 'package:rikulo_commons/mirrors.dart';

import "orm.dart";
import "spi.dart";
import "metamodel.dart";
import "criteria.dart";

//src
part "src/impl/NoSuchClassException.dart";
part "src/impl/HashCodeUtil.dart";
part "src/impl/TableGeneratorImpl.dart";
part "src/impl/SequenceGeneratorImpl.dart";

part "src/impl/EntityManagerImpl.dart";
part "src/impl/EntityManagerFactoryImpl.dart";
part "src/impl/PersistenceUtilImpl.dart";
part "src/impl/PersistenceUnitUtilImpl.dart";
part "src/impl/EntityInfo.dart";

//spi
part "src/impl/spi/PersistenceProviderImpl.dart";

//metamodel
part "src/impl/metamodel/MetamodelImpl.dart";
part "src/impl/metamodel/MetaTypeImpl.dart";
part "src/impl/metamodel/BasicTypeImpl.dart";
part "src/impl/metamodel/ManagedTypeImpl.dart";
part "src/impl/metamodel/EntityTypeImpl.dart";
part "src/impl/metamodel/EmbeddableTypeImpl.dart";
part "src/impl/metamodel/MappedSuperclassTypeImpl.dart";
part "src/impl/metamodel/IdentifiableTypeImpl.dart";

part "src/impl/metamodel/AttributeImpl.dart";
part "src/impl/metamodel/SingularAttributeImpl.dart";
part "src/impl/metamodel/PluralAttributeImpl.dart";
part "src/impl/metamodel/CollectionAttributeImpl.dart";
part "src/impl/metamodel/ListAttributeImpl.dart";
part "src/impl/metamodel/QueueAttributeImpl.dart";
part "src/impl/metamodel/SetAttributeImpl.dart";
part "src/impl/metamodel/MapAttributeImpl.dart";

//sql
part "src/impl/sql/SqlGenerator.dart";
part "src/impl/sql/SqlType.dart";
part "src/impl/sql/SqlTypeMapping.dart";
part "src/impl/sql/SqlToken.dart";
part "src/impl/sql/SqlTokenMapping.dart";
part "src/impl/sql/SqlEnums.dart";
part "src/impl/sql/TextFormat.dart";

//criteria