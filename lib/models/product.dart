class Product {
  final int brandId;
  final double bruttoVolume;
  final double bruttoWeight;
  final String comment;
  final String contents;
  final DateTime createdAt;
  final bool depositEnabled;
  final double depositPrice;
  final double depositVat;
  final double depositVatPrice;
  final String description;
  final int id;
  final String name;
  final int numberInPackage;
  final int packageType;
  final String packageBarcode;
  final int productGroup;
  final String productBarcode;
  final String productImage;
  final DateTime updatedAt;
  final double volume;
  final double weight;

  Product({
    this.brandId,
    this.bruttoVolume,
    this.bruttoWeight,
    this.comment,
    this.contents,
    this.createdAt,
    this.depositEnabled,
    this.depositPrice,
    this.depositVat,
    this.depositVatPrice,
    this.description,
    this.id,
    this.name,
    this.numberInPackage,
    this.packageType,
    this.packageBarcode,
    this.productGroup,
    this.productBarcode,
    this.productImage,
    this.updatedAt,
    this.volume,
    this.weight,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
        brandId: json['brand_id'],
        bruttoVolume: json['brutto_volume'].toDouble(),
        bruttoWeight: json['brutto_weight'].toDouble(),
        comment: json['comment'],
        contents: json['contents'],
        createdAt: DateTime.parse(json['created_at']),
        depositEnabled: json['deposit_enabled'],
        depositPrice: json['deposit_price'].toDouble(),
        depositVat: json['deposit_vat']?.toDouble(),
        depositVatPrice: json['deposit_vat_price']?.toDouble(),
        description: json['description'],
        id: json['id'],
        name: json['name'],
        numberInPackage: json['number_in_package'],
        packageType: json['packageType'],
        packageBarcode: json['package_barcode'],
        productGroup: json['productGroup'],
        productBarcode: json['product_barcode'],
        productImage: json['product_image'],
        updatedAt: DateTime.parse(json['updated_at']),
        volume: json['volume'].toDouble(),
        weight: json['weight'].toDouble(),
    );
  }
}