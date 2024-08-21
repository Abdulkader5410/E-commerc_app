import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/category/data/model/categ_model.dart';
import 'package:ecommerce_app/features/category/domain/entity/categ_entity.dart';

abstract class CategDomRepo {
  Future<Either<Failure, List<CategModel>>> getAllCateg();
  Future<Either<Failure, CategModel>> getOneCateg(String name);
  Future<Either<Failure, Unit>> createCateg(CategEntity categEntity);
  Future<Either<Failure, Unit>> updateCateg(int categId, String name);
  Future<Either<Failure, Unit>> deleteCateg(int categId);
}
