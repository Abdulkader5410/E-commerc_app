import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/exception/server_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignUpLocalDataSource {
  int getUserId();
  String getUserToken();
  Future<Unit> cacheUserId(int userId);
  Future<Unit> cacheUserToken(String token);
}

class SignUpLocalDataSourceImpl implements SignUpLocalDataSource {
  final SharedPreferences sp;

  SignUpLocalDataSourceImpl({required this.sp});

  @override
  Future<Unit> cacheUserId(int userId) {
    sp.setInt("CACHED_USER_ID", userId);
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheUserToken(String token) {
    sp.setString("CACHED_USER_TOKEN", token);
    return Future.value(unit);
  }

  @override
  int getUserId() {
    final userId = sp.getInt("CACHED_USER_ID");
    if (userId != null) {
      return userId;
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  String getUserToken() {
    final userToken = sp.getString("CACHED_USER_TOKEN");
    if (userToken != null) {
      return userToken;
    } else {
      throw EmptyCacheException();
    }
  }
}
