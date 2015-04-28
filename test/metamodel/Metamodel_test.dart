library metamodel_test;

import 'package:rikulo_orm/orm.dart';
import 'package:rikulo_orm/impl.dart';
import 'package:rikulo_orm/spi.dart';
import "package:unittest/unittest.dart";

main() {
  group('Metamodel >', () {
    test('creation', () {
      new MetamodelImpl(new PersistenceUnitInfo("my_pu",
        PersistenceUnitTransactionType.RESOURCE_LOCAL,
        "ppcn",
        [],
        [],
        SharedCacheMode.ALL,
        ValidationMode.AUTO,
        {}
      ), new OrmInfo());
    });
  });
}

@entity
class Person {
  
}