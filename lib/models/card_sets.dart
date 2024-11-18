class CardSets {
  final String set_name;
  final String set_code;
  final String set_rarity;
  final String set_rarity_code;
  final String set_price;

  CardSets({
    required this.set_name,
    required this.set_code,
    required this.set_rarity,
    required this.set_rarity_code,
    required this.set_price,
    

  });

  factory CardSets.fromJson(Map<String, dynamic> json){
    return CardSets(
      set_name: json['set_name'],
      set_code: json['set_code'], 
      set_rarity: json['set_rarity'], 
      set_rarity_code: json['set_rarity_code'],
      set_price: json['set_price']
      );
  }
}