import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:ecommerce_app/core/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserProfile(int userId);
  Future<Unit> signInUser(UserModel userModel);
  Future<Unit> deleteAccount(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  DioConsumer dio;
  UserModel? userModel;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUserProfile(int userId) async {
    try {
      final response = await dio.get(EndPoints.baseUrl + EndPoints.signin);

      var decodedJson = json.decode(response.data);
      var userModel = decodedJson
          .map<UserModel>((postModel) => UserModel.fromjson(postModel))
          .toList();
      return Future.value(userModel);
    } on ServerException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> signInUser(UserModel userModel) async {
    try {

      final body = {
        ApiKey.username: userModel.username,
        ApiKey.password: userModel.password
      };

      final response =
          await dio.post(EndPoints.baseUrl + EndPoints.signin, data: body);

      print("RESPONSE IN LOGIN  >>>>>>>>>>>>>>>>>>  $response");

      userModel = UserModel.fromjson(response);

      // final decodedToken = JwtDecoder.decode(siginModel!.accessToken);

      print("USER  >>>>>>>>>>>>>>>>>>  ${userModel.token}"); //sub => userID

      return Future.value(unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }

  @override
  Future<Unit> deleteAccount(int userId) async {
    try {
      final response = await dio
          .delete(EndPoints.baseUrl + EndPoints.getUserEndPoint(userId));

      return Future.value(unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }
}
