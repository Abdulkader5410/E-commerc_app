import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/dom_repo/cart_dom_repo.dart';

class CartDataRepo extends CartDomRepo {
  final CartRemoteDataSource remoteDataSource;
  final Networkinfo networkinfo;

  CartDataRepo({
    required this.networkinfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, CartModel>> getCart(int userId) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteCart = await remoteDataSource.getCart(userId);
        return Right(remoteCart);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }
}
