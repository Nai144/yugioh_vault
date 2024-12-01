import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';


class CardDetailScreen extends StatelessWidget {
  final YugiohCard2 card;

  const CardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
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