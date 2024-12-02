import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'package:share_plus/share_plus.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_vault/providers/deck_provider.dart';

// Pantalla de detalles de la carta
class CardDetailScreen extends StatelessWidget {
  final YugiohCard2 card;

  const CardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final tempDir = await getTemporaryDirectory();
              final path = '${tempDir.path}/${card.name}.jpg';
              await Dio().download(card.cardImages.first.imageUrl, path);
              Share.shareXFiles([XFile(path)], text: 'Check out this card: ${card.name}');
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen de la carta
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        card.cardImages.first.imageUrlSmall,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Nombre y descripción
                Text(
                  card.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  card.desc,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                // Detalles adicionales
                _buildInfoCard(
                  title: 'Card Details',
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type: ${card.humanReadableCardType}'),
                      Text('Race: ${card.race}'),
                      if (card.attribute != null) Text('Attribute: ${card.attribute}'),
                      Text('Archetype: ${card.archetype}'),
                      if (card.level != null) Text('Level: ${card.level}'),
                      if (card.atk != null) Text('ATK: ${card.atk}'),
                      if (card.def != null) Text('DEF: ${card.def}'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Sets y rarezas
                if (card.cardSets.isNotEmpty)
                  _buildInfoCard(
                    title: 'Card Sets',
                    content: Column(
                      children: card.cardSets.map((set) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${set.setName} - ${set.setRarity} (\$${set.setPrice})',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 20),
                // Precios
                if (card.cardPrices.isNotEmpty)
                  _buildInfoCard(
                    title: 'Prices',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TCGPlayer: \$${card.cardPrices.first.tcgplayerPrice}'),
                        Text('eBay: \$${card.cardPrices.first.ebayPrice}'),
                        Text('Amazon: \$${card.cardPrices.first.amazonPrice}'),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                // Botón de enlace
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (card.ygoprodeckUrl.isNotEmpty) {
                        launchUrl(Uri.parse(card.ygoprodeckUrl));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'View on YGOPRODeck',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
       floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              final deckProvider = Provider.of<DeckProvider>(context, listen: false);
              deckProvider.addCard(card);

              // Mostrar mensaje con SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Carta añadida al mazo.'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add),
          ),
        ],
      )
     
    );
  }

  Widget _buildInfoCard({required String title, required Widget content}) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }
}