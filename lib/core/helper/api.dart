import 'package:dio/dio.dart';

class Api {
  static const _apiKey = '8e5db6ec712b68e46c30f22ddcf2184d';
  final String _baseURL = 'https://api.themoviedb.org/3';
  final Dio dio;

  Api(this.dio);
  getRequest({
    required String url,
  }) async {
    Response response = await dio.get("$_baseURL$url&api_key=$_apiKey");
    return response.data['results'];
  }
}
