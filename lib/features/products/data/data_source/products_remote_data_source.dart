


import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/features/products/data/model/pro_response_model.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getAllProdtcs(String name);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  DioConsumer dio;

  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getAllProdtcs(String name) async {
    try {
      final response = await dio.get(EndPoints.getProByCategEndPoint(name));

      ProResModel prm = ProResModel.fromjson(response);
      List<ProductModel> products = prm.products;

      return Future.value(products);
    } on ServerException {
      throw ServerException();
    }
  }
}
