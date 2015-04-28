import 'package:rikulo_orm/impl.dart';
import 'package:unittest/unittest.dart';

main() {
  group('SimpleMappingTest', () {
    test('no capacity', () {
      var stm = new SqlTypeMapping()..put(SqlType.VARCHAR, "TEXT");
      expect(stm.getScript(SqlType.VARCHAR), 'TEXT');
    });

    test('with capacity', () {
      var stm = new SqlTypeMapping()..put(SqlType.VARCHAR, 'VARCHAR({l})', 255);
      expect(stm.getScript(SqlType.VARCHAR, 100), 'VARCHAR(100)');
    });
  });
}
