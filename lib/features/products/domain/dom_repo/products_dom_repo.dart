import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';

abstract class ProductsDomRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts(String name);
}
