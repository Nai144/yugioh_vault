import 'package:flutter/material.dart';
import 'package:yugioh_vault/screens/card_detail_screen.dart';
import 'package:yugioh_vault/screens/test_deck_screen.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';

class DeckScreen extends StatefulWidget {
  const DeckScreen({super.key});

  @override
  State<DeckScreen> createState() => _ApiTendenciasScreenState();
}

class _ApiTendenciasScreenState extends State<DeckScreen> {
  final YugiohApiService _apiService = YugiohApiService();
  List<YugiohCard2> cards = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }
  

  Future<void> _fetchCards() async {
    try {
      final fetchedCards = await _apiService.getTrendingCards(); // Reemplaza con tu endpoint
      setState(() {
        cards = fetchedCards;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching cards: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tendencias desde API'),
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
        child: isLoading
        ? const Center(child: CircularProgressIndicator())
        : cards.isEmpty
        ? const Center(
          child: Text(
            'No se encontraron cartas.',
            style: TextStyle(color: Colors.white),
          ),
        )
        : ListView.builder(
          itemCount: cards.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            final card = cards[index];
            return GestureDetector(
              onTap: () {
                // Navegar a una pantalla de detalles o realizar otra acción.
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TestDeckScreen(allCards: cards),
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
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(15),
                      ),
                      child: Container(
                        height: 120,
                        width: 120,
                        color: const Color.fromARGB(255, 36, 6, 43), // Fondo de contenedor para manejar áreas vacías si la imagen no ocupa todo el espacio
                        child: Image.network(
                          card.cardImages.first.imageUrlSmall,
                          fit: BoxFit.contain, // Ajusta la imagen dentro del espacio disponible sin recortarla
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              card.type,
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
