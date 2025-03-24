import 'package:dio/dio.dart';
import 'package:flowery/core/config/routes_name.dart';
import 'package:flutter/widgets.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure( {required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad SSL certificate error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioExcep.response!.statusCode!,
          dioExcep.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'There is no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'UnExcepted error , Please try again',
        );
      default:
        return ServerFailure(
          errorMessage: 'Oops there is an error , Please try later',
        );
    }
  }
  factory ServerFailure.fromResponse(int statusCode, jsonData) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        if (jsonData["message"] != null &&
            jsonData["message"].toString().contains(
              "fails to match the required pattern",
            )) {
          return ServerFailure(
            errorMessage:
                "Password must contain at least:\n - 8 characters\n - One uppercase letter\n - One lowercase letter\n - One number\n - One special character.",
          );
        } else if (jsonData["message"].contains("token not provided ") ||
            jsonData["message"].contains("invalid token")) {}
        return ServerFailure(errorMessage: jsonData["message"]);
      case 404:
        if (jsonData["message"] != null &&
            jsonData["message"].contains(
              '"There is no account with this email address',
            )) {
          return ServerFailure(errorMessage: jsonData["message"]);
        } else {
          return ServerFailure(errorMessage: 'Requested resource not found.');
        }
      case 409:
        return ServerFailure(errorMessage: 'Account Already Exists.');
      case 500:
        return ServerFailure(
          errorMessage: 'Internal server error. Please try again later.',
        );
      default:
        return ServerFailure(
          errorMessage: 'Unexpected error. Status Code: $statusCode',
        );
    }
  }
}
