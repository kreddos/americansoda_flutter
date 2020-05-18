class _ProductGroup {
  final int id;
  final List<int> pricingPolicies;
  final List<int> products;

  _ProductGroup({
    this.id,
    this.pricingPolicies,
    this.products,
  });

  factory _ProductGroup.fromJson(dynamic json) {
    return _ProductGroup(
      id: json['id'],
      pricingPolicies: List<int>.from(json['pricingPolicies']),
      products: List<int>.from(json['products']),
    );
  }
}

class Nomenclature {
  final int id;
  final List<_ProductGroup> productGroups;

  Nomenclature({
    this.id,
    this.productGroups,
  });

  factory Nomenclature.fromJson(dynamic json) {
    return Nomenclature(
        id: json['id'],
        productGroups: json['productGroups'].map<_ProductGroup>((e) => _ProductGroup.fromJson(e)).toList()
    );
  }
}