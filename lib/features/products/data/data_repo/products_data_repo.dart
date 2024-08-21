import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/products/data/data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';
import 'package:ecommerce_app/features/products/domain/dom_repo/products_dom_repo.dart';

class ProductsDataRepo extends ProductsDomRepo {
  final ProductsRemoteDataSource remoteDataSource;
  final Networkinfo networkinfo;

  ProductsDataRepo({
    required this.networkinfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts(String name) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProdtcs(name);
        return Right(remoteProducts);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }
}
