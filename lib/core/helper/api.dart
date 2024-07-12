import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Api {
  static const _apiKey = '8e5db6ec712b68e46c30f22ddcf2184d';
  final String _baseURL = 'https://api.themoviedb.org/3';

  Future<Either<List, String>> getRequest({
    required String url,
  }) async {
    Response response;
    try {
      response = await Dio().get("$_baseURL$url&api_key=$_apiKey");
      return left(response.data['results']);
    } on DioException catch (e) {
      return right(handleDioExceptions(e));
    } catch (e) {
      return right("Something went Wrong , Please try again");
    }
  }

  String handleDioExceptions(DioException e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        return "The server's certificate could not be verified. Please check your network security settings.";
      case DioExceptionType.badResponse:
        return "The server responded with an invalid response. Please try again later.";
      case DioExceptionType.cancel:
        return "The request was canceled. Please try again.";
      case DioExceptionType.connectionError:
        return "There was a connection error. Please check your internet connection.";
      case DioExceptionType.connectionTimeout:
        return "The connection has timed out. Please try again later.";
      case DioExceptionType.receiveTimeout:
        return "The server took too long to respond. Please try again later.";
      case DioExceptionType.sendTimeout:
        return "The request took too long to send. Please check your internet connection and try again.";
      case DioExceptionType.unknown:
        return "An unknown error occurred. Please try again later.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}
