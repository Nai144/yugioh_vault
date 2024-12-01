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
  final CardImages? image; // Solo una imagen
  final CardSets? set;     // Solo un conjunto
  final CardPrices? price; // Solo un precio
  final String? ygoprodeckUrl;

  YugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.desc,
    required this.race,
    this.archetype,
    this.image,
    this.set,
    this.price,
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
      image: json['card_images'] ,
      set: json['card_sets'][0]["image_url"],
      price: json['card_prices'],
      ygoprodeckUrl: json['ygoprodeck_url'],
    );
  }


}

