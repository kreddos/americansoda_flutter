class Banner {
  int id;
  String image;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String url;

  Banner({
    this.id,
    this.image,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.url,
  });

  factory Banner.fromJson(dynamic json) {
    return Banner(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        url: json['url'],
    );
  }
}