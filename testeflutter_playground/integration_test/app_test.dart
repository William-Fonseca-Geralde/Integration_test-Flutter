import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testeflutter_playground/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Teste do Aplicativo", () {
    testWidgets('Teste na Operação de Favoritar', (tester) async {
      await tester.pumpWidget(const MyApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Adicionado aos favoritos'), findsOneWidget);
      }

      await tester.tap(find.text('Favoritos'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Item Removido dos favoritos'), findsOneWidget);
      }
    });
  });
}