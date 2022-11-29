import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';

class ProductDetailModel extends Equatable {
  const ProductDetailModel({
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
  final List<String> imageUrls;
  final int productRating;
  final String productSize;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json['id'],
        productName: json['productName'],
        productDescription: json['productDescription'],
        productRating: json['productRating'],
        productSize: json['productSize'],
        imageUrls: json['imageUrls'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'productDescription': productDescription,
        'productRating': productRating,
        'productSize': productSize,
        'imageUrls': imageUrls,
      };
  ProductDetail toEntity() {
    return ProductDetail(
      id: id,
      productName: productName,
      productDescription: productDescription,
      productRating: productRating,
      productSize: productSize,
      imageUrls: imageUrls,
    );
  }

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
