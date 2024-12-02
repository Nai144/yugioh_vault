import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/providers/deck_provider.dart';

class TestDeckScreen extends StatelessWidget {
  const TestDeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Mazos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Consumer<DeckProvider>(
            builder: (context, deckProvider, child) {
              // Verificamos si el mazo está vacío
              if (deckProvider.deck.cards.isEmpty) {
                return const Center(
                  child: Text(
                    'Tu mazo está vacío.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }

              // Si el mazo no está vacío, mostramos las cartas como una cuadrícula
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas
                  crossAxisSpacing: 10, // Espaciado horizontal
                  mainAxisSpacing: 10, // Espaciado vertical
                  childAspectRatio: 0.6, // Relación de aspecto de las cartas
                ),
                itemCount: deckProvider.deck.cards.length,
                itemBuilder: (context, index) {
                  final card = deckProvider.deck.cards[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color.fromARGB(221, 41, 1, 39),
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.network(
                              card.cardImages.first.imageUrlSmall,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            card.name,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
