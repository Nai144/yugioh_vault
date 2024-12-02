import 'package:flutter/material.dart';
import 'package:yugioh_vault/models/deck.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';

class TestDeckScreen extends StatefulWidget {
  final List<YugiohCard2> allCards;

  const TestDeckScreen({Key? key, required this.allCards}) : super(key: key);

  @override
  _TestDeckScreenState createState() => _TestDeckScreenState();
}

class _TestDeckScreenState extends State<TestDeckScreen> {
  final Deck _deck = Deck('Mi Mazo');

  void _addCard(YugiohCard2 card) {
    final success = _deck.addCard(card);
    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo agregar la carta ${card.name}.')),
      );
    } else {
      setState(() {});
    }
  }

  void _removeCard(YugiohCard2 card) {
    _deck.removeCard(card);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Mazos: ${_deck.name}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // Mazo actual
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: _deck.cards.length,
                itemBuilder: (context, index) {
                  final card = _deck.cards[index];
                  return ListTile(
                    leading: Image.network(
                      card.cardImages.first.imageUrlSmall,
                      width: 50,
                    ),
                    title: Text(card.name, style: const TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () => _removeCard(card),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(color: Colors.white),
          // Lista de todas las cartas para agregar al mazo
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: widget.allCards.length,
                itemBuilder: (context, index) {
                  final card = widget.allCards[index];
                  return ListTile(
                    leading: Image.network(
                      card.cardImages.first.imageUrlSmall,
                      width: 50,
                    ),
                    title: Text(card.name, style: const TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () => _addCard(card),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}