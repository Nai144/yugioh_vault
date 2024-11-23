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
  final String ygoprodeckUrl;
  final CardSets cardSets;
  final CardImages cardImages;
  final CardPrices cardPrices; 

  

  YugiohCard({
    required this.id,
    required this.name,
    required this.type,
    required this.humanReadableCardType,
    required this.frameType,
    required this.desc,
    required this.race,
    required this.archetype,
    required this.ygoprodeckUrl,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
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
      ygoprodeckUrl: json['cardImages'][0]['imageUrl'],
      cardSets: json['cardSets'],
      cardImages: json['cardImages'],
      cardPrices: json['cardPrices'],
    );
  }
}

