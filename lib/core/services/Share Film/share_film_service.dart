import 'dart:convert';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/services/Get%20FilmTailer/get_film_tailer.dart';
import 'package:share_plus/share_plus.dart';

class ShareFilmService {
  share({required FilmModel film}) async {
    Map<String, dynamic> filmData = await _toJsonFormat(film: film);
    String filmAsJson = jsonEncode(filmData);
    await Share.share(
      "share - ${film.title!}",
      subject: filmAsJson,
    );
  }

  Future<Map<String, dynamic>> _toJsonFormat({required FilmModel film}) async {
    String tailerKey = await GetFilmTailer().getTailer(filmID: film.id!);
    return {
      'filmName': film.title,
      'overview': film.overview,
      'releaseDate': film.releaseDate,
      'voteAverage': film.voteAverage,
      'poster': 'https://image.tmdb.org/t/p/w500${film.posterPath}',
      'tailerURL': 'https://www.youtube.com/watch?v=$tailerKey',
    };
  }
}
