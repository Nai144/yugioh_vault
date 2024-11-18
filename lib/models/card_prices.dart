class CardPrices{
  final String cardmarket_price;
  final String tcgplayer_price;
  final String ebay_price;
  final String amazon_price;
  final String coolstuffinc_price;

  CardPrices({
    required this.cardmarket_price,
    required this.tcgplayer_price,
    required this.ebay_price,
    required this.amazon_price,
    required this.coolstuffinc_price,
    

  });

  factory CardPrices.fromJson(Map<String, dynamic> json){
    return CardPrices(
      cardmarket_price: json['cardmarket_price'],
      tcgplayer_price: json['tcgplayer_price'], 
      ebay_price: json['ebay_price'], 
      amazon_price: json['amazon_price'],
      coolstuffinc_price: json['coolstuffinc_price']
    );
  }
}