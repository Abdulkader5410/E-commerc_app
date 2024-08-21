import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';

class DeleteCategUC {
  late final CategDomRepo categDomRepo;

  DeleteCategUC({required this.categDomRepo});

  Future<Either<Failure, Unit>> call(int categId ) async {
    return await categDomRepo.deleteCateg(categId);
  }
}