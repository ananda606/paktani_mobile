import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/domain/entities/product_detail.dart';

//belom selese
class ProductDetailModel extends Equatable {
  ProductDetailModel(
      {required this.id,
      required this.productName,
      required this.productDescription,
      required this.imageUrls});
  final int id;
  final String productName;
  final String productDescription;
  final List<String> imageUrls;
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json['id'],
        productName: json['productName'],
        productDescription: json['productDescription'],
        imageUrls: json['imageUrls'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'productDescription': productDescription,
        'imageUrls': imageUrls,
      };
  ProductDetail toEntity() {
    return ProductDetail();
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        productDescription,
        imageUrls,
      ];
}
