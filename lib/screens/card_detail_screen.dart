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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen grande de la carta
              Center(
                child: Image.network(
                  card.cardImages.first.imageUrlSmall,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              // Nombre y descripción
              Text(
                card.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                card.desc,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Detalles adicionales
              Text(
                'Type: ${card.type}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Race: ${card.race}'),
              Text('Archetype: ${card.archetype ?? 'None'}'),
              const SizedBox(height: 16),
              // Rareza y precios
              if (card.cardSets != null ) ...[
                Text(
                  'Set: ${card.cardSets} (${card.cardSets ?? 'Unknown'})',
                ),
              ] else ...[
                const Text('Set: None'),
              ],
              Text( 
                'Price (TCGPlayer): \$${card.cardPrices ?? 'N/A'}',
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Link
              TextButton(
                onPressed: () {
                  // Abre la URL
                  if (card.ygoprodeckUrl != null) {
                    launchUrl(Uri.parse(card.ygoprodeckUrl!));
                  }
                },
                child: const Text('View on YGOPRODeck'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
