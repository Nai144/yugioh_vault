class CardImages {
  final String id;
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;

  CardImages({
    required this.id,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,

  });

  factory CardImages.fromJson(Map<String, dynamic> json){
    return CardImages(
      id: json['id'],
      imageUrl: json['imageUrl'], 
      imageUrlSmall: json['imageUrlSmall'], 
      imageUrlCropped: json['imageUrlCropped']
    );
  }
}