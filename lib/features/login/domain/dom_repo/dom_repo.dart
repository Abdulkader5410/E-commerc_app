import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';

abstract class UserDomRepo {
  Future<Either<Failure, UserEntity>> getUserProfile(int userId);
  Future<Either<Failure, Unit>> signInUser(UserEntity userEntity);
  Future<Either<Failure, Unit>> deleteAccount(int id);
}
