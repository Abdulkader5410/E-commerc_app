import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/dio_consumer.dart';
import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/models/user_model.dart';

abstract class SignUpRemoteDataSource {
  Future<Unit> signUpUser(UserModel userModel);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  DioConsumer dio;
  UserModel? userModel;

  SignUpRemoteDataSourceImpl({required this.dio});


  @override
  Future<Unit> signUpUser(UserModel userModel) async {
    try {
      final body = {
        ApiKey.username: userModel.username,
        ApiKey.password: userModel.password,
        ApiKey.email: userModel.password,
        ApiKey.firstName: userModel.password,
        ApiKey.lastName: userModel.password,
        ApiKey.gender: userModel.password,
      };

      final response =
          await dio.post(EndPoints.baseUrl + EndPoints.addUser, data: body);

      print("USER  >>>>>>>>>>>>>>>>>>  $response");

      userModel = UserModel.fromjson(response);

      // final decodedToken = JwtDecoder.decode(siginModel!.accessToken);

      print("USER  >>>>>>>>>>>>>>>>>>  ${userModel.token}"); //sub => userID

      return Future.value(unit);
    } on DioException catch (e) {
      handleEx(e);
      return Future(() => unit);
    }
  }

  
  
}
