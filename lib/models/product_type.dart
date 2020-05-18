class ProductType {
  final DateTime createdAt;
  final int id;
  final String name;
  final DateTime updatedAt;

  ProductType({
    this.createdAt,
    this.id,
    this.name,
    this.updatedAt,
  });

  factory ProductType.fromJson(dynamic json) {
    return ProductType(
        createdAt: DateTime.parse(json['created_at']),
        id: json['id'],
        name: json['name'],
        updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}