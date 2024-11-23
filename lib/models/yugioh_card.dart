import 'package:yugioh_vault/models/card_images.dart';
import 'package:yugioh_vault/models/card_prices.dart';
import 'package:yugioh_vault/models/card_sets.dart';

class YugiohCard {
  final String id;
  final String name;
  final String type;
  final String desc;
  final String race;
  final String? archetype;
  final List<CardImages> images;
  final List<CardSets>? sets;
  final CardPrices? prices;
   final String? ygoprodeckUrl;

  YugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.desc,
    required this.race,
    this.archetype,
    required this.images,
    this.sets,
    this.prices,
    this.ygoprodeckUrl,
  });

  factory YugiohCard.fromJson(Map<String, dynamic> json) {
    return YugiohCard(
      id: json['id'].toString(),
      name: json['name'],
      type: json['type'],
      desc: json['desc'],
      race: json['race'],
      archetype: json['archetype'],
      images: (json['card_images'] as List<dynamic>)
          .map((image) => CardImages.fromJson(image))
          .toList(),
      sets: json['card_sets'] != null
          ? (json['card_sets'] as List<dynamic>)
              .map((set) => CardSets.fromJson(set))
              .toList()
          : null,
      prices: json['card_prices'] != null
          ? CardPrices.fromJson(json['card_prices'])
          : null,
          ygoprodeckUrl: json['ygoprodeck_url'],
    );
  }
}
