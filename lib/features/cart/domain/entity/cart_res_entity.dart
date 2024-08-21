import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartResEntity extends Equatable {
  List<CartModel> carts;
  int total;
  int skip;
  int limit;

  CartResEntity({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [
        carts,
        total,
        skip,
        limit,
      ];
}
