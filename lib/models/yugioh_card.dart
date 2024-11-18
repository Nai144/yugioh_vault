import 'package:yugioh_vault/models/card_images.dart';
import 'package:yugioh_vault/models/card_prices.dart';
import 'package:yugioh_vault/models/card_sets.dart';

class YugiohCard {
  final String id;
  final String name;
  final String type;
  final String humanReadableCardType;
  final String frameType;
  final String desc;
  final String race;
  final String archetype;
  final String ygoprodeck_url;
  final CardSets card_sets;
  final CardImages card_images;
  final CardPrices card_prices; 

  

  YugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.humanReadableCardType,
    required this.frameType,
    required this.desc,
    required this.race,
    required this.archetype,
    required this.ygoprodeck_url,
    required this.card_sets,
    required this.card_images,
    required this.card_prices,
  });

  factory YugiohCard.fromJson(Map<String, dynamic> json) {
    return YugiohCard(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      humanReadableCardType: json['humanReadableCardType'],
      desc: json['desc'],
      frameType: json['frameType'],
      race: json['race'],
      archetype: json['archetype'],
      ygoprodeck_url: json['card_images'][0]['image_url'],
      card_sets: json['card_sets'],
      card_images: json['car_images'],
      card_prices: json['card_prices'],
    );
  }
}

