import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testeflutter_playground/models/favoritos.dart';
import 'package:testeflutter_playground/screens/home_page.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favoritos>(
  create: (context) => Favoritos(),
  child: const MaterialApp(
    home: HomePage(),
  ),
);

void main() {
  group('Grupo de Teste no HomePage', () {
    testWidgets('Teste de Scroll', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(
        find.byType(ListView), 
        const Offset(0, -200), 
        3000
      );
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testando os IconButtons', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Adicionado aos favoritos'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removido dos favoritos'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}