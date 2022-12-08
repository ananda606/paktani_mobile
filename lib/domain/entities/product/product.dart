import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productRating,
    required this.productSize,
    required this.imageUrls,
  });
  final int id;
  final String productName;
  final String productDescription;
  final int productRating;
  final String productSize;
  final String imageUrls;

  const Product.productlist({
     required this.id,
    required this.productName,
    required this.productDescription,
    required this.productRating,
    required this.productSize,
    required this.imageUrls,
  });
  @override
  List<Object?> get props => [
        id,
        productName,
        productDescription,
        productRating,
        productSize,
        imageUrls,
      ];
}
