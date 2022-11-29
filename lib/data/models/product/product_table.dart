import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/domain/entities/product/product.dart';
import 'package:paktani_mobile/domain/entities/movie_detail.dart';
import 'package:paktani_mobile/domain/entities/product/product_detail.dart';

class ProductTable extends Equatable {
  final int id;
  final String productName;
  final String productDescription;
  final int productRating;
  final String productSize;
  final List<String> imageUrls;
  ProductTable({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productRating,
    required this.productSize,
    required this.imageUrls,
  });
  factory ProductTable.fromEntity(ProductDetail product) => ProductTable(
        id: product.id,
        productName: product.productName,
        productDescription: product.productDescription,
        productRating: product.productRating,
        productSize: product.productSize,
        imageUrls: product.imageUrls,
      );
  factory ProductTable.fromMap(Map<String, dynamic> map) => ProductTable(
        id: map['id'],
        productName: map['productName'],
        productDescription: map['productDescription'],
        productRating: map['productRating'],
        productSize: map['productSize'],
        imageUrls: map['imageUrls'],
      );
  Map<String, dynamic> toJson() => {
       'id': id,
        'productName': productName,
        'productDescription': productDescription,
        'productRating': productRating,
        'productSize': productSize,
        'imageUrls': imageUrls,
      };
  Product toEntity() => Product.productlist(
      id: id,
      productName: productName,
      productDescription: productDescription,
      productRating: productRating,
      productSize: productSize,
      imageUrls: imageUrls,
      );
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
