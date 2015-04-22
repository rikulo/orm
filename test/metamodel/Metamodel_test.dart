library metamodel_test;

import '../../lib/orm.dart';
import '../../lib/impl.dart';
import '../../lib/spi.dart';
import "../../packages/unittest/unittest.dart";

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