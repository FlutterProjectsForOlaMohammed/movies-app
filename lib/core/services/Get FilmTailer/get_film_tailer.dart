import 'package:dio/dio.dart';

class GetFilmTailer {
  final String _apiKey = '8e5db6ec712b68e46c30f22ddcf2184d';
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  Future<String> getTailer({
    required int filmID,
  }) async {
    try {
      Response response = await Dio()
          .get('$_baseUrl/$filmID/videos?language=en-US&api_key=$_apiKey');
      for (var film in response.data["results"]) {
        if (film["type"] == "Trailer") {
          return film['key'] as String;
        }
      }
      return "No Tailer Found";
    } on DioException catch (_) {
      return "No Tailer Found";
    }
  }
}
