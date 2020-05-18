class ProductGroup {
  final DateTime createdAt;
  final int id;
  final String image;
  final String name;
  final int productTypeId;
  final int salesUnitVolume;
  final DateTime updatedAt;
  final int vat;

  ProductGroup({
    this.createdAt,
    this.id,
    this.image,
    this.name,
    this.productTypeId,
    this.salesUnitVolume,
    this.updatedAt,
    this.vat,
  });

  factory ProductGroup.fromJson(dynamic json) {
    return ProductGroup(
        createdAt: DateTime.parse(json['created_at']),
        id: json['id'],
        image: json['image'],
        name: json['name'],
        productTypeId: json['product_type_id'],
        salesUnitVolume: json['sales_unit_volume'],
        updatedAt: DateTime.parse(json['updated_at']),
        vat: json['vat'],
    );
  }
}