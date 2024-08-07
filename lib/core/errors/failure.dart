import 'package:dio/dio.dart';
import 'package:movie_app/core/Functions/show_message.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class DioExceptionsFailures extends Failure {
  late String message;

  DioExceptionsFailures({
    required message,
  }) : super(errMessage: message);
  factory DioExceptionsFailures.handleErrors(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioExceptionsFailures(
          message: 'Connection timed out.',
        );
      case DioExceptionType.sendTimeout:
        return DioExceptionsFailures(
          message: 'Request timed out while sending.',
        );
      case DioExceptionType.receiveTimeout:
        return DioExceptionsFailures(
          message:
              'Response timed out. The server might be slow or unavailable.',
        );
      case DioExceptionType.badCertificate:
        return DioExceptionsFailures(
          message:
              'Invalid SSL certificate. Please ensure you have a secure connection.',
        );
      case DioExceptionType.badResponse:
        return DioExceptionsFailures.badResponse(
            statusCode: dioError.response!.statusCode!);

      case DioExceptionType.cancel:
        return DioExceptionsFailures(
          message: 'Request was cancelled.',
        );
      case DioExceptionType.connectionError:
        showMessage(
            text:
                "There is No Internt Connection , Please Check Your Connection ... ");
        return DioExceptionsFailures(
          message: 'Connection error. Please check your internet connection.',
        );
      default:
        if (dioError.message?.contains("SocketException") ?? false) {
          showMessage(
              text:
                  "There is No Internt Connection , Please Check Your Connection ... ");
          return DioExceptionsFailures(
            message: "No Internet Connection , Check Your Connection . ",
          );
        } else {
          return DioExceptionsFailures(
            message: "An error occurred. Please try again later.",
          );
        }
    }
  }
  factory DioExceptionsFailures.badResponse({
    required int statusCode,
  }) {
    if (statusCode == 400) {
      return DioExceptionsFailures(
          message: 'Bad request. Please check your input and try again.');
    } else if (statusCode == 401) {
      return DioExceptionsFailures(
          message: 'Unauthorized. Please check your credentials.');
    } else if (statusCode == 403) {
      return DioExceptionsFailures(
          message: 'Forbidden. You do not have permission to access this.');
    } else if (statusCode == 404) {
      return DioExceptionsFailures(
          message: 'Not found. The requested resource could not be found.');
    } else if (statusCode == 500) {
      return DioExceptionsFailures(
          message: 'Server error. Please try again later.');
    } else if (statusCode == 429) {
      return DioExceptionsFailures(
        message:
            "You sent too many requests in a given amount of time , Please Wait !!",
      );
    } else {
      return DioExceptionsFailures(
          message: "An error occurred. Please try again later.");
    }
  }
}

class UnExpectedException extends Failure {
  final String message;

  UnExpectedException({
    required this.message,
  }) : super(errMessage: message);
}
