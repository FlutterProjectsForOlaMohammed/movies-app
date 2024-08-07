import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/presentation/views%20model/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/films_list_view.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/list_view_films_failure.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/loading.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/no_films_found.dart';

class ShowFilms extends StatelessWidget {
  const ShowFilms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsCategoryBloc, FilmsCategoryState>(
        builder: (context, state) {
      if (state is FilmsCategorySuccess) {
        if (state.filmsList.isNotEmpty) {
          return Expanded(
            child: FilmsListView(
              films: state.filmsList,
            ),
          );
        } else {
          return const NoFilmsFound();
        }
      } else if (state is FilmsCategoryFailure) {
        return ListViewFilmsFailure(
          error: state.errMessage,
        );
      } else {
        return const Expanded(child: Loading());
      }
    });
  }
}
