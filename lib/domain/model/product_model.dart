import 'dart:convert';

class ProductsModel {
  int? id;
  String productName;
  String productLocation;
  double? productRating;
  String productDescription;
  String productImageUrl;
  int? productPrice;

  ProductsModel({
    this.id,
    required this.productName,
    required this.productLocation,
    required this.productDescription,
    required this.productImageUrl,
    this.productRating,
    this.productPrice,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      productName: map['productName'],
      productLocation: map['productLocation'],
      productDescription: map['productDescription'],
      productImageUrl: map['productImageUrl'],
      productRating: map['productRating'],
      productPrice: map['productPrice'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'productLocation': productLocation,
      'productDescription': productDescription,
      'productImageUrl': productImageUrl,
      'productRating': productRating,
      'productPrice':productPrice,
    };
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $productName, productDescription: $productDescription, productImageUrl: $productImageUrl}';
  }

}

List<ProductsModel> productFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ProductsModel>.from(
      data.map((item) => ProductsModel.fromJson(item)));
}

String productToJson(ProductsModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
