import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'package:http/http.dart' as http;

class DeckScreen extends StatefulWidget {
  const DeckScreen({Key? key}) : super(key: key);

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching cards: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tendencias desde API'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : cards.isEmpty
              ? Center(child: Text('No se encontraron cartas.'))
              : ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return GestureDetector(
                      onTap: () {
                        // Navega a otra pantalla (si es necesario)
                      },
                      child: Card(
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                card.cardImages.first.imageUrlSmall,
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    card.type,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
