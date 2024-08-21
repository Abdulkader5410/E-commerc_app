import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/features/products/data/model/prodcut_model.dart';

abstract class ProDetailsRemoteDataSource {
  Future<ProductModel> getProDetails(int id);
}

class ProDetailsRemoteDataSourceImpl implements ProDetailsRemoteDataSource {
  DioConsumer dio;

  ProDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<ProductModel> getProDetails(int id) async {
    try {
      final response =
          await dio.get("${EndPoints.baseUrl}${EndPoints.products}$id");

      ProductModel pro = ProductModel.fromjson(response);

      return Future.value(pro);
    } on ServerException {
      throw ServerException();
    }
  }
}
