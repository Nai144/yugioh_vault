import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/yugioh_card.dart';

class CardDetailScreen extends StatelessWidget {
  final YugiohCard card;

  const CardDetailScreen({Key? key, required this.card}) : super(key: key);

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
                  card.card_images.image_url,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              // Nombre y descripción
              Text(
                card.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                card.desc,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Detalles adicionales
              Text(
                'Type: ${card.type}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Race: ${card.race}'),
              Text('Archetype: ${card.archetype}'),
              SizedBox(height: 16),
              // Rareza y precios
              Text(
                'Set: ${card.card_sets.set_name} (${card.card_sets.set_rarity})',
              ),
              Text(
                'Price (TCGPlayer): \$${card.card_prices.tcgplayer_price}',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              SizedBox(height: 16),
              // Link
              TextButton(
                onPressed: () {
                  // Abre la URL
                  launchUrl(card.ygoprodeck_url as Uri);
                },
                child: Text('View on YGOPRODeck'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}