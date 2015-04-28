import 'package:rikulo_orm/orm.dart';
import 'package:rikulo_orm/spi.dart';
import "package:unittest/unittest.dart";

main() {
  group("PersistanceUnitInfo >", () {
    test("creation", () {
      var pui = new PersistenceUnitInfo("my_pu",
      PersistenceUnitTransactionType.RESOURCE_LOCAL,
      "ppcn",
      ['mcn'],
      [],
      SharedCacheMode.ALL,
      ValidationMode.AUTO,
      {});

      expect(pui.persistenceUnitName, 'my_pu');
      expect(pui.persistenceProviderClassName, 'ppcn');
      expect(pui.transactionType, PersistenceUnitTransactionType.RESOURCE_LOCAL);
      expect(pui.managedClassNames, ['mcn']);
      expect(pui.sharedCacheMode, SharedCacheMode.ALL);
      expect(pui.validationMode, ValidationMode.AUTO);
    });
  });
}