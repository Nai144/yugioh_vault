import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/providers/card_provider.dart';

class CardPageTest extends StatelessWidget {
  const CardPageTest({super.key});

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    String? selectedType;

    return Scaffold(
      appBar: AppBar(title: const Text('Búsqueda Avanzada')),
      body: Column(
        children: [
          TextField(
            onSubmitted: (query) => cardProvider.searchCards(query),
            decoration: const InputDecoration(
              labelText: 'Buscar por nombre',
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButton<String>(
            value: selectedType,
            items: ['Monster', 'Spell', 'Trap'].map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (type) {
              cardProvider.fetchCardsByType(type!);
            },
          ),
          ElevatedButton(
            onPressed: () => cardProvider.fetchAllCards(),
            child: const Text('Mostrar todas las cartas'),
          ),
          if (cardProvider.isLoading) const CircularProgressIndicator(),
          Expanded(
            child: ListView.builder(
              itemCount: cardProvider.cards.length,
              itemBuilder: (context, index) {
                final card = cardProvider.cards[index];
                return ListTile(
                  title: Text(card.name),
                  subtitle: Text(card.type),
                  // ignore: unrelated_type_equality_checks
                  trailing: card.image != false
                      ? Image.network(card.image as String)
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
