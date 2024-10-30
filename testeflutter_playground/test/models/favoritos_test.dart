import 'package:test/test.dart';
import 'package:testeflutter_playground/models/favoritos.dart';

void main() {
  group('Testando Provider App', () {
    var favoritos = Favoritos();

    test('Um novo item adicionado', () {
      var numero = 35;
      favoritos.add(numero);
      expect(favoritos.itens.contains(numero), true);
    });

    test('Um item deveria ser removido', () {
      var number = 45;
      favoritos.add(number);
      expect(favoritos.itens.contains(number), true);
      favoritos.remove(number);
      expect(favoritos.itens.contains(number), false);
    });
  });
}