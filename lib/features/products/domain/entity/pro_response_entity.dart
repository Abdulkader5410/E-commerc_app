import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProResEntity extends Equatable {
  List<ProductModel> products;
  int total;
  int skip;
  int limit;

  ProResEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [
        products,
        total,
        skip,
        limit,
      ];
}
