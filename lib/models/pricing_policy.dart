class PricingPolicy {
  final DateTime createdAt;
  final int customerId;
  final int id;
  final String price;
  final int productGroupId;
  final int productsRange;
  final DateTime updatedAt;

  PricingPolicy({
    this.createdAt,
    this.customerId,
    this.id,
    this.price,
    this.productGroupId,
    this.productsRange,
    this.updatedAt,
  });

  factory PricingPolicy.fromJson(dynamic json) {
    return PricingPolicy(
        createdAt: DateTime.parse(json['created_at']),
        customerId: json['customer_id'],
        id: json['id'],
        price: json['price'],
        productGroupId: json['product_group_id'],
        productsRange: json['products_range'],
        updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}