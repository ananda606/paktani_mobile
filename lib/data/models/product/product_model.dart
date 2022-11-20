import 'package:dartz/dartz.dart';
import 'package:paktani_mobile/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel({
    required this.id,
    required this.productName,
    required this.descriptionProduct,
    required this.imageUrls,
  });
  final int id;
  final String productName;
  final String descriptionProduct;
  final List<String> imageUrls;
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        productName: json['productName'],
        descriptionProduct: json['descriptionProduct'],
        imageUrls: json['imageUrls'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'descriptionProduct': descriptionProduct,
        'imageUrls': imageUrls,
      };
  Product toEntity() {
    return Product(
        id: this.id,
        productName: this.productName,
        descriptionProduct: this.descriptionProduct,
        imageUrls: this.imageUrls);
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        descriptionProduct,
        imageUrls,
      ];
}
