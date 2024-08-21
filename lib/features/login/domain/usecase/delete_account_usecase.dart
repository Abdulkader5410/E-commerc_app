import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/login/domain/dom_repo/dom_repo.dart';

class DeleteAccountUC {
  late final UserDomRepo userDomRepo;

  DeleteAccountUC({required this.userDomRepo});

  Future<Either<Failure, Unit>> call(int id) async {
    return await userDomRepo.deleteAccount(id);
  }
}
