import 'package:dartz/dartz.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<List<FilmModel>, Failure>> getTrendingFilms();
  Future<Either<List<FilmModel>, Failure>> getPopularFilms();
  Future<Either<List<FilmModel>, Failure>> getHighestRatedFilms();
  Future<Either<String, Failure>> getFilmTailer({required String filmID});
  Future<void> shareFilm({
    required FilmModel film,
    required String tailerKey,
  });
}
