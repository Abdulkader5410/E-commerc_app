import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

class GetOneCategeUC {
  late final CategDomRepo categDomRepo;

  GetOneCategeUC({required this.categDomRepo});

  Future<Either<Failure, CategEntity>> call(String name) async {
    return await categDomRepo.getOneCateg(name);
  }
}
