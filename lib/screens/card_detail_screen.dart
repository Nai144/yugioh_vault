import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/yugioh_card.dart';

class CardDetailScreen extends StatelessWidget {
  final YugiohCard card;

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
                  card.cardImages.imageUrl,
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
              Text('Archetype: ${card.archetype}'),
              const SizedBox(height: 16),
              // Rareza y precios
              Text(
                'Set: ${card.cardSets.setName} (${card.cardSets.setRarity})',
              ),
              Text(
                'Price (TCGPlayer): \$${card.cardPrices.tcgplayerPrice}',
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Link
              TextButton(
                onPressed: () {
                  // Abre la URL
                  launchUrl(card.ygoprodeckUrl as Uri);
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