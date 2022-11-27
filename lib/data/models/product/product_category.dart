import 'package:paktani_mobile/domain/entities/product/category.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  CategoryModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Category toEntity() {
    return Category( name: this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
