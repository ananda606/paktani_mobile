import 'package:equatable/equatable.dart';

class Category extends Equatable {
  Category({
    required this.name,
  });
  final String name;
  @override
  List<Object> get props => [name];
}
