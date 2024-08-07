part of 'films_category_bloc.dart';

sealed class FilmsCategoryEvent extends Equatable {
  const FilmsCategoryEvent();

  @override
  List<Object> get props => [];
}

class ChooseFilmsCategoryEvent extends FilmsCategoryEvent {
  final String categoryName;

  const ChooseFilmsCategoryEvent({required this.categoryName});
}
