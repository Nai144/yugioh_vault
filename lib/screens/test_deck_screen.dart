import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/providers/deck_provider.dart';

class TestDeckScreen extends StatelessWidget {
  const TestDeckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilizamos Consumer para escuchar cambios en el DeckProvider
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mazos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Consumer<DeckProvider>(
        builder: (context, deckProvider, child) {
          // Verificamos si el mazo está vacío
          if (deckProvider.deck.cards.isEmpty) {
            return Center(
              child: Text(
                'Tu mazo está vacío.',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          // Si el mazo no está vacío, mostramos las cartas
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: deckProvider.deck.cards.length,
            itemBuilder: (context, index) {
              final card = deckProvider.deck.cards[index];
              return ListTile(
                leading: Image.network(
                  card.cardImages.first.imageUrlSmall,
                  width: 50,
                ),
                title: Text(card.name, style: const TextStyle(color: Colors.white)),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
