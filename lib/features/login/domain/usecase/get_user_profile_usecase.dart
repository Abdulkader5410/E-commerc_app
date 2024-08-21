
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/login/domain/dom_repo/dom_repo.dart';

class GetUserProfileUC {
  late final UserDomRepo userDomRepo;

  GetUserProfileUC({ required this.userDomRepo});

  Future<Either<Failure, UserEntity>> call(int userId) async {
    return await userDomRepo.getUserProfile(userId);
  }
}
