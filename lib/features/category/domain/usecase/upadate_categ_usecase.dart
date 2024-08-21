import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';

class UpdateCategUC {
  late final CategDomRepo categDomRepo;

  UpdateCategUC({required this.categDomRepo});

  Future<Either<Failure, Unit>> call(int categId , String name) async {
    return await categDomRepo.updateCateg(categId, name);
  }
}