class CardPrices{
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

  factory CardPrices.fromJson(Map<String, dynamic> json){
    return CardPrices(
      cardmarketPrice: json['cardmarketPrice'],
      tcgplayerPrice: json['tcgplayerPprice'], 
      ebayPrice: json['ebayPrice'], 
      amazonPrice: json['amazonPrice'],
      coolstuffincPrice: json['coolstuffincPrice']
    );
  }
}