class CardImages {
  final String imageUrl;
  final String imageUrlSmall;
  final String imageUrlCropped;

  CardImages({
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.imageUrlCropped,
  });

  factory CardImages.fromJson(Map<String, dynamic> json) {
    return CardImages(
      imageUrl: json['image_url'],
      imageUrlSmall: json['image_url_small'],
      imageUrlCropped: json['image_url_cropped'],
    );
  }
}