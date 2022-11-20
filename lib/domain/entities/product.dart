import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product(
      {required this.id,
      required this.productName,
      required this.descriptionProduct,
      required this.imageUrls});
  final int id;
  final String productName;
  final String descriptionProduct;
  final List<String> imageUrls;
  Product.productlist({
    required this.id,
    required this.productName,
    required this.descriptionProduct,
    required this.imageUrls,
  });
  List<Object?> get props => [
        id,
        productName,
        descriptionProduct,
        imageUrls,
      ];
}
