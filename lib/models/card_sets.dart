class CardSets {
  final String setName;
  final String setCode;
  final String setRarity;
  final String setRarityCode;
  final String setPrice;

  CardSets({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSets.fromJson(Map<String, dynamic> json) {
    return CardSets(
      setName: json['set_name'],
      setCode: json['set_code'],
      setRarity: json['set_rarity'],
      setRarityCode: json['set_rarity_code'],
      setPrice: json['set_price'],
    );
  }
}