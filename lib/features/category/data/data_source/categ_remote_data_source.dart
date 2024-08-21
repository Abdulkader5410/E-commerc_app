import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/features/category/data/model/categ_model.dart';

abstract class CategRemoteDataSource {
  Future<List<CategModel>> getAllCateg();
  Future<CategModel> getOneCateg(String name);
  Future<Unit> createCateg(CategModel categModel);
  Future<Unit> updateCateg(int categId, String name);
  Future<Unit> deleteCateg(int categId);
}

class CategRemoteDataSourceImpl implements CategRemoteDataSource {
  DioConsumer dio;

  CategRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategModel>> getAllCateg() async {
    try {
      List<dynamic> response = await dio
          .get(EndPoints.baseUrl + EndPoints.products + EndPoints.categories);

      List<CategModel> categs = response
          .map((categ) => CategModel.fromjson(categ))
          .toList();

      return Future.value(categs);
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<CategModel> getOneCateg(String name) async {
    try {
      final response = await dio.get(
          "${EndPoints.baseUrl}${EndPoints.products}${EndPoints.categories}$name");

      var decodedJson = json.decode(response.data);
      var categModel =
          decodedJson.map<CategModel>((categ) => CategModel.fromjson(categ));
      return Future.value(categModel);
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> createCateg(CategModel categModel) async {
    try {
      final body = {ApiKey.name: categModel.name};

      await dio.post("${EndPoints.baseUrl}${EndPoints.categories}/",
          data: body);

      return Future.value(unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }

  @override
  Future<Unit> updateCateg(int categId, String name) async {
    try {
      final body = {
        ApiKey.name: name,
      };

      await dio.put("${EndPoints.baseUrl}${EndPoints.categories}$categId",
          data: body);

      return Future.value(unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }

  @override
  Future<Unit> deleteCateg(int categId) async {
    try {
      await dio.delete("${EndPoints.baseUrl}${EndPoints.categories}$categId");
      return Future(() => unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }
}
