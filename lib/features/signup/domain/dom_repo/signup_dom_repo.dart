import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';

abstract class SignUpDomRepo {
  Future<Either<Failure, Unit>> signUpUser(UserEntity userEntity);
}
