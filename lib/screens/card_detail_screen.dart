import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/yugioh_card.dart';

// Pantalla de detalles de la carta
class CardDetailScreen extends StatelessWidget {
  final YugiohCard card;

  const CardDetailScreen({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name), // Título de la AppBar con el nombre de la carta
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
                  card.card_images.image_url,
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
                'Set: ${card.card_sets.set_name} (${card.card_sets.set_rarity})',
              ),
              Text(
                'Price (TCGPlayer): \$${card.card_prices.tcgplayer_price}',
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Link para ver en YGOPRODeck
              TextButton(
                onPressed: () {
                  // Abre la URL
                  launchUrl(card.ygoprodeck_url as Uri);
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