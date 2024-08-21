import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/pro%20details/data/data_source/pro_details_remote_data_source.dart';
import 'package:ecommerce_app/features/pro%20details/domain/dom_repo/pro_details_dom_repo.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';

class ProDetailsDataRepo extends ProDetailsDomRepo {
  final ProDetailsRemoteDataSource remoteDataSource;
  final Networkinfo networkinfo;

  ProDetailsDataRepo({
    required this.networkinfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ProductModel>> getProDetails(int id) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getProDetails(id);
        return Right(remoteProduct);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }
}
