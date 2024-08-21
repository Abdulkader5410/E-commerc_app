import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';

import '../dom_repo/pro_details_dom_repo.dart';

class GetProDetailsUC {
  late final ProDetailsDomRepo proDetailsDomRepo;

  GetProDetailsUC({required this.proDetailsDomRepo});

  Future<Either<Failure, ProductEntity>> call(int id) async {
    return await proDetailsDomRepo.getProDetails(id);
  }
}
