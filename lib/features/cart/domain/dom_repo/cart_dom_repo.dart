import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';

abstract class CartDomRepo {
  Future<Either<Failure, CartModel>> getCart(int userId);
}
