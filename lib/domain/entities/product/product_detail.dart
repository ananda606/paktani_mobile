import 'package:paktani_mobile/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class ProductDetail extends Equatable {
  ProductDetail({
  required this.productName,
  required this.productDescription,
  required this.productRating,
  required this.productSize,
  });

  final String productName;
  final String productDescription;
  final int productRating;
  final String productSize;


  @override
  List<Object?> get props => [
       productName,
       productDescription,
       productRating,
       productSize,
      ];
}
