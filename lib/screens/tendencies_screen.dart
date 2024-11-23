
import 'package:flutter/material.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';
import 'package:yugioh_vault/models/yugioh_card.dart';

class TendenciasScreen extends StatefulWidget {
  const TendenciasScreen({super.key});

  @override
  State<TendenciasScreen> createState() => _TendenciasScreenState();
}

class _TendenciasScreenState extends State<TendenciasScreen> {
  final YugiohApiService _apiService = YugiohApiService();
  List<YugiohCard> trendingCards = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTrendingCards();
  }

  Future<void> _fetchTrendingCards() async {
    try {
      // Llama a la API para obtener las cartas
      final cards = await _apiService.getAllCards(); // Puedes cambiar el query
      setState(() {
        trendingCards = cards.take(2).toList(); // Tomar las primeras 2 cartas
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching trending cards: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tendencia')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : trendingCards.isEmpty
              ? const Center(child: Text('No trending cards found.'))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: trendingCards.map((card) {
                      return Card(
                        elevation: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              card.images[0].imageUrl,
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                card.name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
    );
  }
}