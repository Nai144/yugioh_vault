import 'package:flutter/material.dart';
import 'package:yugioh_vault/models/yugioh_card2.dart';
import 'package:yugioh_vault/screens/card_detail_screen.dart';


class CardItem extends StatelessWidget {
  final YugiohCard2 card;

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
                card.cardImages.first.imageUrlSmall,
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
                    Text('Rarity: ${card.cardSets}'),
                    const SizedBox(height: 8),
                    Text(
                      'Price: \$${card.cardPrices}',
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