import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/category/data/data_source/categ_remote_data_source.dart';
import 'package:ecommerce_app/features/category/data/model/categ_model.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

class CategDataRepo extends CategDomRepo {
  final CategRemoteDataSource remoteDataSource;
  final Networkinfo networkinfo;

  CategDataRepo({
    required this.networkinfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> deleteCateg(int categId) async {
    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.deleteCateg(categId);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategModel>>> getAllCateg() async {
    if (await networkinfo.isConnected) {
      try {
        final remoteCategs = await remoteDataSource.getAllCateg();

        return Right(remoteCategs);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, CategModel>> getOneCateg(String name) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteCateg = await remoteDataSource.getOneCateg(name);

        return Right(remoteCateg);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createCateg(CategEntity categEntity) async {
    final categModel = CategModel(
      name: categEntity.name,
      slug: categEntity.slug,

    );

    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.createCateg(categModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCateg(int categId, String name) async {


    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.updateCateg(categId, name);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
