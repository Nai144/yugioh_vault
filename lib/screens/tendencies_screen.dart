import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yugioh_vault/screens/lista_tendencias_screen.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';

import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'dart:convert';

class TendenciasScreen extends StatefulWidget {
  const TendenciasScreen({super.key});

  @override
  State<TendenciasScreen> createState() => _TendenciasScreenState();
}


class _TendenciasScreenState extends State<TendenciasScreen> {
  final YugiohApiService _apiService = YugiohApiService();
//  List<YugiohCard> trendingCards = [];
  bool isLoading = true;
  List<YugiohCard2> cards = [];
  @override
  void initState() {
    super.initState();
 //   _fetchTrendingCards();
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
    var jsonString = await rootBundle.loadString('lib/assets/Archetype_List.json');
    return json.decode(jsonString);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yu-Gi-Oh Cards'),
      ),
      body: cards.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                            height: 120, // Aumenta el tamaño de la imagen
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



