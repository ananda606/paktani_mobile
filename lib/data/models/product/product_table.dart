import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/domain/entities/product.dart';
import 'package:paktani_mobile/domain/entities/movie_detail.dart';

class ProductTable extends Equatable {
  final int id;
  final String productName;
  final String description;
  final List<String> imageUrls;
  ProductTable({
    required this.id,
    required this.productName,
    required this.description,
    required this.imageUrls,
  });
  factory ProductTable.fromEntity(Product product) => ProductTable(
        id: product.id,
        productName: product.productName,
        description: product.descriptionProduct,
        imageUrls: product.imageUrls,
      );
  factory ProductTable.fromMap(Map<String, dynamic> map) => ProductTable(
        id: map['id'],
        productName: map['productName'],
        description: map['description'],
        imageUrls: map['imageUrls'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'description': description,
        'imageUrls': imageUrls,
      };
  Product toEntity() => Product.productlist(
        id: id,
        productName: productName,
        descriptionProduct: description,
        imageUrls: imageUrls,
      );
  @override
  List<Object?> get props => [
        id,
        productName,
        description,
        imageUrls,
      ];
}
