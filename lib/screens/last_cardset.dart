import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'dart:convert';
import 'package:yugioh_vault/screens/lista_tendencias_screen.dart';


class LastCardsetScreen extends StatefulWidget {
  const LastCardsetScreen({super.key});

  @override
  State<LastCardsetScreen> createState() => _LastCardsetScreenState();
}


class _LastCardsetScreenState extends State<LastCardsetScreen> {
  bool isLoading = true;
  List<YugiohCard2> cards = [];

  @override
  void initState() {
    super.initState();
    _loadArchetypes().then((loadedCards) {
      setState(() {
        cards = loadedCards;
      });
    });
  }

  Future<List<YugiohCard2>> _loadArchetypes() async {
    final decodedJson = await _loadArchetypesData();
    return (decodedJson['data'] as List)
        .map((card) => YugiohCard2.fromJson(card))
        .toList();
  }

  Future<Map<String, dynamic>> _loadArchetypesData() async {
    var jsonString =
        await rootBundle.loadString('lib/assets/json/Set_2024_info.json');
    return json.decode(jsonString);
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Últimos sets Principales'),
      backgroundColor: Colors.deepPurple,
    ),
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: cards.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaTendenciasScreen(
                          pathOfArchetype: card.archetype,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Imagen de la carta
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                          child: Container(
                            height: 120,
                            width: 120,
                            color: const Color.fromARGB(255, 36, 6, 43),
                            child: Image.network(
                              card.cardImages.first.imageUrlSmall,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Detalles de la carta
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  card.type,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    ),
  );
}
}