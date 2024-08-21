import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/error_model.dart';

class ServerDioException implements Exception {
  ErrorModel errorModel;

  ServerDioException({required this.errorModel});
}

void handleEx(DioException e) {
  switch (e.type) {
    case DioExceptionType.badCertificate:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionTimeout:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerDioException(
          errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      // throw ServerDioException(errorModel: ErrorModel.fromJson(e.response!.data));
      print("ERROR 1      ERROR 1     ERROR 1      ERROR 1");

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode!) {
        case 400:
          // throw ServerDioException(
          //     errorModel: ErrorModel.fromJson(e.response!.data));
          print("ERROR 2     ERROR 2     ERROR 2       ERROR 2");

        case 401:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 403:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 404:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 409:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 422:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 504:
          throw ServerDioException(
              errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
