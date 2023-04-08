class Url {
  const Url({
    this.type,
    this.url,
  });

  final String? type;
  final String? url;

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      type: json['type'],
      url: json['url'],
    );
  }
}
