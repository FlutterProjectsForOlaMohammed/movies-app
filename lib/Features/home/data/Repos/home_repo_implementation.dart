import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/data/Repos/home_repo.dart';
import 'package:movie_app/core/Functions/transform_film_to_json_format.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/helper/api.dart';
import 'package:share_plus/share_plus.dart';

class HomeRepoImplementation implements HomeRepo {
  HomeRepoImplementation(this.api);
  final Api api;
  @override
  Future<Either<List<FilmModel>, Failure>> getHighestRatedFilms() async {
    try {
      var response = await api.getRequest(
        url:
            "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200",
      );
      List<FilmModel> films = [];
      for (int i = 0; i < response.length; i++) {
        films.add(
          FilmModel.fromJson(response[i]),
        );
      }
      return left(films);
    } on DioException catch (e) {
      return right(
        DioExceptionsFailures.handleErrors(e),
      );
    } on Exception catch (e) {
      return right(
        UnExpectedException(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<List<FilmModel>, Failure>> getPopularFilms() async {
    try {
      var response = await api.getRequest(
        url:
            "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc",
      );
      List<FilmModel> films = [];
      for (int i = 0; i < response.length; i++) {
        films.add(
          FilmModel.fromJson(response[i]),
        );
      }
      return left(films);
    } on DioException catch (e) {
      return right(
        DioExceptionsFailures.handleErrors(e),
      );
    } catch (e) {
      return right(
        UnExpectedException(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<List<FilmModel>, Failure>> getTrendingFilms() async {
    try {
      var response = await api.getRequest(
        url: "/trending/movie/week?language=en-US",
      );
      List<FilmModel> films = [];
      for (int i = 0; i < response.length; i++) {
        films.add(
          FilmModel.fromJson(response[i]),
        );
      }
      return left(films);
    } on DioException catch (e) {
      return right(
        DioExceptionsFailures.handleErrors(e),
      );
    } on Exception catch (e) {
      return right(
        UnExpectedException(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<String, Failure>> getFilmTailer(
      {required String filmID}) async {
    const String apiKey = '8e5db6ec712b68e46c30f22ddcf2184d';
    const String baseUrl = 'https://api.themoviedb.org/3/movie';
    try {
      Response response = await Dio()
          .get('$baseUrl/$filmID/videos?language=en-US&api_key=$apiKey');
      for (var film in response.data["results"]) {
        if (film["type"] == "Trailer") {
          return left(
            film['key'] as String,
          );
        }
      }
      return right(
        UnExpectedException(message: "No Tailer Found"),
      );
    } on DioException catch (e) {
      return right(
        DioExceptionsFailures.handleErrors(e),
      );
    }
  }

  @override
  Future<void> shareFilm(
      {required FilmModel film, required String tailerKey}) async {
    Map<String, dynamic> filmData =
        await toJsonFormat(film: film, tailerKey: tailerKey);
    String filmAsJson = jsonEncode(filmData);
    await Share.share(
      "share - ${film.title!}",
      subject: filmAsJson,
    );
  }
}
