import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/core/models/user_model.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/login/data/data_source/login_local_data_source.dart';
import 'package:ecommerce_app/features/login/data/data_source/login_remote_data_source.dart';
import 'package:ecommerce_app/features/login/domain/dom_repo/dom_repo.dart';

class UserDataRepo extends UserDomRepo {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final Networkinfo networkinfo;

  UserDataRepo(
      {required this.networkinfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> deleteAccount(int id) async {
    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.deleteAccount(id);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserProfile(int userId) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.getUserProfile(userId);

        return Right(remoteUser);
      } on ServerDioException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyFailure());
    }
  }


  @override
  Future<Either<Failure, Unit>> signInUser(UserEntity userEntity) async {
    final userModel = UserModel(
      
      username: userEntity.username,
      password: userEntity.password,
    );

    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.signInUser(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  
}