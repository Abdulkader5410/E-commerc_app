import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_entity.dart';

import '../dom_repo/cart_dom_repo.dart';

class GetCartUC {
  late final CartDomRepo cartDomRepo;

  GetCartUC({required this.cartDomRepo});

  Future<Either<Failure, CartEntity>> call(int userId) async {
    return await cartDomRepo.getCart(userId);
  }
}
