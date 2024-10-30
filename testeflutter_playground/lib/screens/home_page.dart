import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/favoritos.dart';
import 'favoritos_page.dart';

class HomePage extends StatelessWidget {
  static String nomeRota = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Teste'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              context.go('/${FavoritosPage.nomeRota}');
            },
            label: const Text('Favoritos'),
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    var favoritosLista = Provider.of<Favoritos>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: favoritosLista.itens.contains(itemNo)
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            !favoritosLista.itens.contains(itemNo)
                ? favoritosLista.add(itemNo)
                : favoritosLista.remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(favoritosLista.itens.contains(itemNo)
                    ? 'Adicionado aos favoritos'
                    : 'Removido dos favoritos'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        )
      )
    );
  }
}