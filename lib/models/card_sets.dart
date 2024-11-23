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

  factory CardSets.fromJson(Map<String, dynamic> json){
    return CardSets(
      setName: json['setName'],
      setCode: json['setCode'], 
      setRarity: json['setRarity'], 
      setRarityCode: json['setRarityCode'],
      setPrice: json['setPrice']
      );
  }
}