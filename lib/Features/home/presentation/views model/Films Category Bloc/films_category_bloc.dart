import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/data/Repos/home_repo_implementation.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/service_locator.dart';
part 'films_category_event.dart';
part 'films_category_state.dart';

class FilmsCategoryBloc extends Bloc<FilmsCategoryEvent, FilmsCategoryState> {
  String category = showFilmsOptions[0];
  FilmsCategoryBloc() : super(FilmsCategoryInitial()) {
    on<ChooseFilmsCategoryEvent>(
      (
        ChooseFilmsCategoryEvent event,
        Emitter<FilmsCategoryState> emit,
      ) async {
        late Either<List<FilmModel>, Failure> response;
        emit(FilmsCategoryLoading());
        if (event.categoryName == showFilmsOptions[0]) {
          category = showFilmsOptions[0];
          response = await getIt<HomeRepoImplementation>().getPopularFilms();
        } else if (event.categoryName == showFilmsOptions[1]) {
          category = showFilmsOptions[1];

          response =
              await getIt<HomeRepoImplementation>().getHighestRatedFilms();
        } else if (event.categoryName == showFilmsOptions[2]) {
          category = showFilmsOptions[2];
          response = await getIt<HomeRepoImplementation>().getTrendingFilms();
        }
        return response.fold(
          (films) {
            return emit(
              FilmsCategorySuccess(filmsList: films, categoryName: category),
            );
          },
          (error) {
            return emit(
              FilmsCategoryFailure(
                errMessage: error.errMessage,
              ),
            );
          },
        );
      },
    );
  }
}
