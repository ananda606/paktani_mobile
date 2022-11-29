import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel({
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
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
  Product toEntity() {
    return Product(
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
