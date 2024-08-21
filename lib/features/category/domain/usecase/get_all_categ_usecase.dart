import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/domain/dom_repo/cate_dom_repo.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

class GetAllCategUC {
  late final CategDomRepo categDomRepo;

  GetAllCategUC({required this.categDomRepo});

  Future<Either<Failure, List<CategEntity>>> call() async {
    return await categDomRepo.getAllCateg();
  }
}
