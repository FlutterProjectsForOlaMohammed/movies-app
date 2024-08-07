import 'package:movie_app/Features/home/data/Models/film_model.dart';

Future<Map<String, dynamic>> toJsonFormat(
    {required FilmModel film, required String tailerKey}) async {
  return {
    'filmName': film.title,
    'overview': film.overview,
    'releaseDate': film.releaseDate,
    'voteAverage': film.voteAverage,
    'poster': 'https://image.tmdb.org/t/p/w500${film.posterPath}',
    'tailerURL': 'https://www.youtube.com/watch?v=$tailerKey',
  };
}
