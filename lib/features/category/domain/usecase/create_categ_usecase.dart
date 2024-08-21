import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

class CreateCategUC {
  late final CategDomRepo categDomRepo;

  CreateCategUC({required this.categDomRepo});

  Future<Either<Failure, Unit>> call(CategEntity categEntity) async {
    return await categDomRepo.createCateg(categEntity);
  }
}
