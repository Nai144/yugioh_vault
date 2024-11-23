class CardPrices {
  final String cardmarketPrice;
  final String tcgplayerPrice;
  final String ebayPrice;
  final String amazonPrice;
  final String coolstuffincPrice;

  CardPrices({
    required this.cardmarketPrice,
    required this.tcgplayerPrice,
    required this.ebayPrice,
    required this.amazonPrice,
    required this.coolstuffincPrice,
  });

  factory CardPrices.fromJson(Map<String, dynamic> json) {
    return CardPrices(
      cardmarketPrice: json['cardmarket_price'],
      tcgplayerPrice: json['tcgplayer_price'],
      ebayPrice: json['ebay_price'],
      amazonPrice: json['amazon_price'],
      coolstuffincPrice: json['coolstuffinc_price'],
    );
  }
}