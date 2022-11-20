import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/domain/entities/product_detail.dart';
//belom selese
class ProductDetailResponse extends Equatable {
  ProductDetailResponse(
      {required this.id,
      required this.productName,
      required this.productDescription,
      required this.imageUrls});
  final int id;
  final String productName;
  final String productDescription;
  final List<String> imageUrls;

  @override
  List<Object?> get props => [id, productName, productDescription, imageUrls,];
}
