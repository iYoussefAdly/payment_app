import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.formDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timeout with api server",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "Send timeout with apiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "Recieve timeout with apiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate with apiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: "Request with apiServer was canceled",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: "Oops there was an Error, Please try again",
        );
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(errorMessage: "Your request is not found");
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: "Server error, please try again later",
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response["error"]["message"]);
    } else {
      return ServerFailure(
        errorMessage: "There was an error, please try again",
      );
    }
  }
}
