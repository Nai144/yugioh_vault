import 'package:flutter/material.dart';
import 'package:yugioh_vault/screens/card_detail_screen.dart';
import '../models/yugioh_card.dart';

class CardItem extends StatelessWidget {
  final YugiohCard card;

  const CardItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          // Aquí podrías navegar a una pantalla de detalles
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardDetailScreen(card: card),
            ),
          );
        },
        child: Row(
          children: [
            // Imagen de la carta
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                card.image as String,
                height: 100,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            // Información de la carta
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(card.type),
                    Text('Rarity: ${card.set! ?? 'Unknown'}'),
                    const SizedBox(height: 8),
                    Text(
                      'Price: \$${card.price ?? 'Unknown'}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}