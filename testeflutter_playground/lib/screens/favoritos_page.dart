import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favoritos.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  static String nomeRota = 'favorito_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Consumer<Favoritos>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.itens.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavoritoItemTile(value.itens[index]),
        )
      ),
    );
  }
}

class FavoritoItemTile extends StatelessWidget {
  const FavoritoItemTile(this.itemNo, {super.key});

  final int itemNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('favoritos_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          onPressed: () {
            Provider.of<Favoritos> (context, listen: false).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item Removido dos favoritos'),
                duration: Duration(seconds: 1),
              )
            );
          },
          icon: const Icon(Icons.close)
        ),
      ),
    );
  }
}