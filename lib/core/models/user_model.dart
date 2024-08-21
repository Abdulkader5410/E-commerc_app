import 'package:ecommerce_app/core/api/endpoints.dart';
import 'package:ecommerce_app/core/enitity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.username,
    required super.password,
    super.email,
    super.firstName,
    super.lastName,
    super.gender,
    super.image,
    super.token,
  });

  factory UserModel.fromjson(Map<String, dynamic> jsonDate) {
    return UserModel(
        id: jsonDate[ApiKey.id],
        username: jsonDate[ApiKey.username],
        password: jsonDate[ApiKey.password],
        firstName: jsonDate[ApiKey.firstName],
        lastName: jsonDate[ApiKey.lastName],
        gender: jsonDate[ApiKey.gender],
        image: jsonDate[ApiKey.image],
        token: jsonDate[ApiKey.token],
        email: jsonDate[ApiKey.email]);
  }
}