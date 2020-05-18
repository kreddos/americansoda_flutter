import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/services.dart';

class NomenclatureService {
  RestService _restService = RestService();

  Future<List<Nomenclature>> loadNomenclature(int customerId) {
    return _restService.request<List>("GET", '/shop/$customerId/nomenclature')
      .then((listJson) => listJson.map((e) => Nomenclature.fromJson(e)).toList());
  }

  Future<List<Product>> loadProducts(int customerId) {
    return _restService.request<List>("GET", '/shop/$customerId/products')
      .then((listJson) => listJson.map((e) => Product.fromJson(e)).toList());
  }

  Future<List<ProductType>> loadProductTypes(int customerId) {
    return _restService.request<List>("GET", '/shop/$customerId/product-types')
      .then((listJson) => listJson.map((e) => ProductType.fromJson(e)).toList());
  }

  Future<List<ProductGroup>> loadProductGroups(int customerId) {
    return _restService.request<List>("GET", '/shop/$customerId/product-groups')
      .then((listJson) => listJson.map((e) => ProductGroup.fromJson(e)).toList());
  }

  Future<List<PricingPolicy>> loadPricingPolicies(int customerId) {
    return _restService.request<List>("GET", '/shop/$customerId/pricing-policies')
      .then((listJson) => listJson.map((e) => PricingPolicy.fromJson(e)).toList());
  }

}