import 'dart:developer';

import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_res_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(int userId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  DioConsumer dio;

  CartRemoteDataSourceImpl({required this.dio});

  @override
  Future<CartModel> getCart(int userId) async {
    try {
      final response = await dio.get(
          "${EndPoints.baseUrl}${EndPoints.carts}${EndPoints.user}$userId");

      print("RES >>>>>>>> $response");

      CartResModel crm = CartResModel.fromjson(response);

      log("crm <<<<<<<< $crm");

      List<CartModel> carts = crm.carts;

      return Future.value(carts[0]);
    } on ServerException {
      throw ServerException();
    }
  }
}
