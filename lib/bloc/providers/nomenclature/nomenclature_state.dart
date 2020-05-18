import 'package:americansoda/models/models.dart';

abstract class NomenclatureState {
  List<Nomenclature> _nomenclature;
  List<Product> _products;
  List<ProductType> _productTypes;
  List<ProductGroup> _productGroups;
  List<PricingPolicy> _pricingPolicy;

  NomenclatureState({
    List<Nomenclature> nomenclature,
    List<Product> products,
    List<ProductType> productTypes,
    List<ProductGroup> productGroups,
    List<PricingPolicy> pricingPolicy,
  }) {
    this._nomenclature = nomenclature;
    this._products = products;
    this._productTypes = productTypes;
    this._productGroups = productGroups;
    this._pricingPolicy = pricingPolicy;
  }

  List<Nomenclature> get nomenclature {
    if (_nomenclature != null) {
      return _nomenclature;
    }
    return <Nomenclature>[];
  }
  List<Product> get products {
    if (_products != null) {
      return _products;
    }
    return <Product>[];
  }
  List<ProductType> get productTypes {
    if (_productTypes != null) {
      return _productTypes;
    }
    return <ProductType>[];
  }
  List<ProductGroup> get productGroups {
    if (_productGroups != null) {
      return _productGroups;
    }
    return <ProductGroup>[];
  }
  List<PricingPolicy> get pricingPolicy {
    if (_pricingPolicy != null) {
      return _pricingPolicy;
    }
    return <PricingPolicy>[];
  }

  List<ShopData> get shopData {
    return nomenclature.map((nomenclatureItem) {
      ProductType productType = productTypes.firstWhere((element) => element.id == nomenclatureItem.id, orElse: () => null);
      int productsCount = nomenclatureItem.productGroups.fold(0, (previousValue, element) => previousValue + element.products.length);

      var mappedGroups = nomenclatureItem.productGroups.map((_productGroup) {
        List<PricingPolicy> _pricingPolicy = pricingPolicy.where((element) => _productGroup.pricingPolicies.contains(element.id)).toList();
        List<Product> _currentProducts = products.where((element) => _productGroup.products.contains(element.id)).toList();
        ProductGroup _currentProductGroup = productGroups.firstWhere((element) => element.id == _productGroup.id, orElse: () => null);

        return ShopDataGroup(
          pricingPolicies: _pricingPolicy,
          products: _currentProducts,
          group: _currentProductGroup,
        );
      }).toList();

      return ShopData(
        productType: productType,
        productsCount: productsCount,
        productGroups: mappedGroups,
      );
    }).toList();
  }
}

class InitialNomenclatureState extends NomenclatureState {
  InitialNomenclatureState({
    List<Nomenclature>nomenclature,
    List<Product>products,
    List<ProductType>productTypes,
    List<ProductGroup>productGroups,
    List<PricingPolicy>pricingPolicy,
  }): super(
    nomenclature: nomenclature,
    products: products,
    productTypes: productTypes,
    productGroups: productGroups,
    pricingPolicy: pricingPolicy,
  );
}

class LoadingNomenclatureState extends NomenclatureState {
  LoadingNomenclatureState({
    List<Nomenclature>nomenclature,
    List<Product>products,
    List<ProductType>productTypes,
    List<ProductGroup>productGroups,
    List<PricingPolicy>pricingPolicy,
  }): super(
    nomenclature: nomenclature,
    products: products,
    productTypes: productTypes,
    productGroups: productGroups,
    pricingPolicy: pricingPolicy,
  );
}

class LoadingSuccessNomenclatureState extends NomenclatureState {
  LoadingSuccessNomenclatureState({
    List<Nomenclature>nomenclature,
    List<Product>products,
    List<ProductType>productTypes,
    List<ProductGroup>productGroups,
    List<PricingPolicy>pricingPolicy,
  }): super(
    nomenclature: nomenclature,
    products: products,
    productTypes: productTypes,
    productGroups: productGroups,
    pricingPolicy: pricingPolicy,
  );
}

class LoadingFailureNomenclatureState extends NomenclatureState {
  final dynamic error;
  LoadingFailureNomenclatureState({
    this.error,
    List<Nomenclature> nomenclature,
    List<Product> products,
    List<ProductType> productTypes,
    List<ProductGroup> productGroups,
    List<PricingPolicy> pricingPolicy,
  }): super(
      nomenclature: nomenclature,
      products: products,
      productTypes: productTypes,
      productGroups: productGroups,
      pricingPolicy: pricingPolicy,
  );
}
