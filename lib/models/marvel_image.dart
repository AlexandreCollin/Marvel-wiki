class MarvelImage {
  const MarvelImage({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  factory MarvelImage.fromJson(Map<String, dynamic> json) {
    return MarvelImage(
      path: json['path'],
      extension: json['extension'],
    );
  }

  String get url => '$path.$extension';
}
