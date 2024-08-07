import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/presentation/views%20model/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/category_name_of_films.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/show_films.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  dynamic films;
  @override
  void initState() {
    super.initState();
    triggerFilmsCubit();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: Colors.white.withOpacity(0.8),
        onRefresh: () async {
          refreshView(context);
        },
        child: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CustomAppBar(),
            CategoryNameOfFilms(),
            SizedBox(
              height: 10,
            ),
            ShowFilms()
          ],
        ),
      ),
    );
  }

  void refreshView(BuildContext context) {
    String category = BlocProvider.of<FilmsCategoryBloc>(context).category;
    BlocProvider.of<FilmsCategoryBloc>(context).add(
      ChooseFilmsCategoryEvent(
        categoryName: category,
      ),
    );
  }

  void triggerFilmsCubit() {
    String category = BlocProvider.of<FilmsCategoryBloc>(context).category;
    BlocProvider.of<FilmsCategoryBloc>(context).add(
      ChooseFilmsCategoryEvent(
        categoryName: category,
      ),
    );
  }
}
