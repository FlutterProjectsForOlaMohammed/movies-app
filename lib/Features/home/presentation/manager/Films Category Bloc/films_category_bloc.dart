import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/services/Get%20Films/get_favorite_films.dart';
import 'package:movie_app/core/services/Get%20Films/get_popular_films.dart';
import 'package:movie_app/core/services/Get%20Films/get_rated_films.dart';
import 'package:movie_app/core/utils/constants.dart';
part 'films_category_event.dart';
part 'films_category_state.dart';

class FilmsCategoryBloc extends Bloc<FilmsCategoryEvent, FilmsCategoryState> {
  FilmsCategoryBloc() : super(FilmsCategoryInitial()) {
    on<ChooseFilmsCategoryEvent>(
      (
        ChooseFilmsCategoryEvent event,
        Emitter<FilmsCategoryState> emit,
      ) async {
        var response;
        String? category;
        emit(FilmsCategoryLoading());
        if (event.categoryName == showFilmsOptions[0]) {
          category = showFilmsOptions[0];
          response = await GetPopularFilms().getFilms();
        } else if (event.categoryName == showFilmsOptions[1]) {
          category = showFilmsOptions[1];

          response = await GetRatedFilms().getFilms();
        } else if (event.categoryName == showFilmsOptions[2]) {
          category = showFilmsOptions[2];
          response = await GetFavoriteFilms().getFilms();
        }
        if (response is String) {
          emit(
            FilmsCategoryFailure(errMessage: response),
          );
        } else {
          emit(
            FilmsCategorySuccess(
                filmsList: response, categoryName: category ?? "Error"),
          );
        }
      },
    );
  }
}
