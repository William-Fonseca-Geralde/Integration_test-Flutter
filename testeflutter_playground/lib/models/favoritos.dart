import 'package:flutter/material.dart';

class Favoritos extends ChangeNotifier {
  final List<int> _favoritoItens = [];

  List<int> get itens => _favoritoItens;

  void add(int itemNo) {
    _favoritoItens.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoritoItens.remove(itemNo);
    notifyListeners();
  }
}