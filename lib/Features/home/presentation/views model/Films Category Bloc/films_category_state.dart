part of 'films_category_bloc.dart';

sealed class FilmsCategoryState extends Equatable {
  const FilmsCategoryState();

  @override
  List<Object> get props => [];
}

final class FilmsCategoryInitial extends FilmsCategoryState {}

final class FilmsCategoryFailure extends FilmsCategoryState {
  final String errMessage;

  const FilmsCategoryFailure({required this.errMessage});
}

final class FilmsCategoryLoading extends FilmsCategoryState {}

final class FilmsCategorySuccess extends FilmsCategoryState {
  final List<FilmModel> filmsList;
  final String categoryName;
  const FilmsCategorySuccess({
    required this.categoryName,
    required this.filmsList,
  });
}
