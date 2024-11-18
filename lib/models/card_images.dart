class CardImages {
  final String id;
  final String image_url;
  final String image_url_small;
  final String image_url_cropped;

  CardImages({
    required this.id,
    required this.image_url,
    required this.image_url_small,
    required this.image_url_cropped,

  });

  factory CardImages.fromJson(Map<String, dynamic> json){
    return CardImages(
      id: json['id'],
      image_url: json['image_url'], 
      image_url_small: json['image_url_small'], 
      image_url_cropped: json['image_url_cropped']
    );
  }
}