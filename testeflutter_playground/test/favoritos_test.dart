import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testeflutter_playground/models/favoritos.dart';
import 'package:testeflutter_playground/screens/favoritos_page.dart';

late Favoritos favoritosList;

Widget createFavoritesScreen() => ChangeNotifierProvider<Favoritos>(
  create: (context) {
    favoritosList = Favoritos();
    return favoritosList;
  },
  child: const MaterialApp(
    home: FavoritosPage(),
  ),
);

void addItems() {
  for (var i = 0; i < 10; i += 2) {
    favoritosList.add(i);
  }
}

void main() {
  group('Teste no FavoritosPage', () {
    testWidgets('Teste se o ListView aparece', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Teste do botão remover', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      addItems();
      await tester.pumpAndSettle();
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byIcon(Icons.close)).length,
          lessThan(totalItems));
      expect(find.text('Item Removido dos favoritos'), findsOneWidget);
    });
  });
}