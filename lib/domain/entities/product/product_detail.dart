import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  ProductDetail({
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
  final List<String> imageUrls;

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
