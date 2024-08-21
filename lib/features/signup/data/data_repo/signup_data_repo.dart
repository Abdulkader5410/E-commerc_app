import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/core/models/user_model.dart';
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/features/signup/data/data_source/signup_local_data_source.dart';
import 'package:ecommerce_app/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:ecommerce_app/features/signup/domain/dom_repo/signup_dom_repo.dart';

class SignUpDataRepo extends SignUpDomRepo {
  final SignUpRemoteDataSource remoteDataSource;
  final SignUpLocalDataSource localDataSource;
  final Networkinfo networkinfo;

  SignUpDataRepo(
      {required this.networkinfo,
      required this.remoteDataSource,
      required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> signUpUser(UserEntity userEntity) async {
    final userModel = UserModel(
      email: userEntity.email,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      gender: userEntity.gender,
      username: userEntity.username,
      password: userEntity.password,
    );

    if (await networkinfo.isConnected) {
      try {
        remoteDataSource.signUpUser(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
