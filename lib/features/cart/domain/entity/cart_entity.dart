import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartEntity extends Equatable {
  int? cartId;
  int? proId;
  int? qun;

  CartEntity({
    this.cartId,
    this.proId,
    this.qun,
  });

  @override
  List<Object?> get props => [
        cartId,
        proId,
        qun,
      ];
}
