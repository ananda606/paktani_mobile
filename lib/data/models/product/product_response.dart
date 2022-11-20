import 'package:equatable/equatable.dart';
import 'package:paktani_mobile/data/models/product/product_model.dart';

class ProductResponse extends Equatable {
  final List<ProductModel> productList;
  ProductResponse({required this.productList});
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        productList: List<ProductModel>.from((json['result'] as List)
            .map((e) => ProductModel.fromJson(e))
            .where((element) => element.id != null)),
      );
  Map<String, dynamic> toJson() => {
        'result': List<dynamic>.from(
          productList.map(
            (e) => e.toJson(),
          ),
        ),
      };
  @override
  List<Object> get props => [productList];
}
