import 'package:americansoda/models/models.dart';

class ShopDataGroup {
  final List<PricingPolicy> pricingPolicies;
  final List<Product> products;
  final ProductGroup group;

  ShopDataGroup({
    this.pricingPolicies,
    this.products,
    this.group,
  });
}

class ShopData {
  final ProductType productType;
  final int productsCount;
  final List<ShopDataGroup> productGroups;

  ShopData({
    this.productType,
    this.productsCount,
    this.productGroups,
  });
}