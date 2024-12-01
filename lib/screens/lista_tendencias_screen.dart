import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yugioh_vault/services/yugioh_api_service.dart';

import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'dart:convert';

class ListaTendenciasScreen extends StatefulWidget {
  final String pathOfArchetype;

  const ListaTendenciasScreen({Key? key, required this.pathOfArchetype})
      : super(key: key);

  @override
  State<ListaTendenciasScreen> createState() => _ListaTendenciasScreenState();
}


class _ListaTendenciasScreenState extends State<ListaTendenciasScreen> {
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
    var jsonString = await rootBundle.loadString(widget.pathOfArchetype);
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
                    // Acción al tocar la tarjeta
                    _showCardDetails(context, card);
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



void _showCardDetails(BuildContext context, YugiohCard2 card) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(card.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(card.cardImages.first.imageUrl),
            SizedBox(height: 10),
            Text(
              card.desc,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              "ATK: ${card.atk} | DEF: ${card.def}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          ),
        ],
      );
    },
  );
}