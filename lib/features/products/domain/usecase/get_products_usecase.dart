import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/dom_repo/products_dom_repo.dart';
import 'package:ecommerce_app/features/products/domain/entity/product_entity.dart';

class GetProductsUC {
  late final ProductsDomRepo progDomRepo;

  GetProductsUC({required this.progDomRepo});

  Future<Either<Failure, List<ProductEntity>>> call(String name) async {
    return await progDomRepo.getAllProducts(name);
  }
}
