import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/login/domain/dom_repo/dom_repo.dart';

class SignInUserUC {
  late final UserDomRepo userDomRepo;

  SignInUserUC({required this.userDomRepo});

  Future<Either<Failure, Unit>> call(UserEntity userEntity) async {
    return await userDomRepo.signInUser(userEntity);
  }
}
