class YugiohCard2 {
  final int id;
  final String name;
  final List<String>? typeline;
  final String type;
  final String humanReadableCardType;
  final String frameType;
  final String desc;
  final String race;
  final int? atk;
  final int? def;
  final int? level;
  final String? attribute;
  final String archetype;
  final String ygoprodeckUrl;
  final List<CardSet> cardSets;
  final List<CardImage> cardImages;
  final List<CardPrice> cardPrices;

  YugiohCard2({
    required this.id,
    required this.name,
    this.typeline,
    required this.type,
    required this.humanReadableCardType,
    required this.frameType,
    required this.desc,
    required this.race,
    this.atk,
    this.def,
    required this.level,
    this.attribute,
    required this.archetype,
    required this.ygoprodeckUrl,
    required this.cardSets,
    required this.cardImages,
    required this.cardPrices,
  });

  factory YugiohCard2.fromJson(Map<String, dynamic> json) {
    return YugiohCard2(
      id: json['id'],
      name: json['name'] ?? 'Desconocido',
      typeline: json['typeline'] != null
          ? List<String>.from(json['typeline'])
          : [],
      type: json['type'] ?? 'Desconocido',
      humanReadableCardType: json['humanReadableCardType'] ?? 'Desconocido',
      frameType: json['frameType'] ?? 'Desconocido',
      desc: json['desc'] ?? 'Desconocido',
      race: json['race'] ?? 'Desconocido',
      atk: json['atk'] ?? 0,
      def: json['def'] ?? 0,
      level: json['level'] ?? 0,
      attribute: json['attribute'] ?? 'Desconocido',
      archetype: json['archetype'] ?? 'Desconocido',
      ygoprodeckUrl: json['ygoprodeck_url'] ?? 'Desconocido',
      cardSets: json['card_sets'] != null
          ? (json['card_sets'] as List)
              .map((set) => CardSet.fromJson(set))
              .toList()
          : [],
      cardImages: (json['card_images'] as List)
          .map((image) => CardImage.fromJson(image))
          .toList(),
      cardPrices: (json['card_prices'] as List)
          .map((price) => CardPrice.fromJson(price))
          .toList(),
    );
  }

  // Método toJson para convertir el objeto en un mapa
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'typeline': typeline,
      'type': type,
      'humanReadableCardType': humanReadableCardType,
      'frameType': frameType,
      'desc': desc,
      'race': race,
      'atk': atk,
      'def': def,
      'level': level,
      'attribute': attribute,
      'archetype': archetype,
      'ygoprodeck_url': ygoprodeckUrl,
      'card_sets': cardSets.map((set) => set.toJson()).toList(),
      'card_images': cardImages.map((image) => image.toJson()).toList(),
      'card_prices': cardPrices.map((price) => price.toJson()).toList(),
    };
  }
}

class CardSet {
  final String setName;
  final String setCode;
  final String setRarity;
  final String setRarityCode;
  final String setPrice;

  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      setName: json['set_name'],
      setCode: json['set_code'],
      setRarity: json['set_rarity'],
      setRarityCode: json['set_rarity_code'],
      setPrice: json['set_price'],
    );
  }

  // Método toJson para convertir CardSet en un mapa
  Map<String, dynamic> toJson() {
    return {
      'set_name': setName,
      'set_code': setCode,
      'set_rarity': setRarity,
      'set_rarity_code': setRarityCode,
      'set_price': setPrice,
    };
  }
}

class CardImage {
  final int id;
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;

  CardImage({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) {
    return CardImage(
      id: json['id'],
      imageUrl: json['image_url'],
      imageUrlSmall: json['image_url_small'],
      imageUrlCropped: json['image_url_cropped'],
    );
  }

  // Método toJson para convertir CardImage en un mapa
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'image_url_small': imageUrlSmall,
      'image_url_cropped': imageUrlCropped,
    };
  }
}

class CardPrice {
  final String cardmarketPrice;
  final String tcgplayerPrice;
  final String ebayPrice;
  final String amazonPrice;
  final String coolstuffincPrice;

  CardPrice({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPrice.fromJson(Map<String, dynamic> json) {
    return CardPrice(
      cardmarketPrice: json['cardmarket_price'],
      tcgplayerPrice: json['tcgplayer_price'],
      ebayPrice: json['ebay_price'],
      amazonPrice: json['amazon_price'],
      coolstuffincPrice: json['coolstuffinc_price'],
    );
  }

  // Método toJson para convertir CardPrice en un mapa
  Map<String, dynamic> toJson() {
    return {
      'cardmarket_price': cardmarketPrice,
      'tcgplayer_price': tcgplayerPrice,
      'ebay_price': ebayPrice,
      'amazon_price': amazonPrice,
      'coolstuffinc_price': coolstuffincPrice,
    };
  }
}