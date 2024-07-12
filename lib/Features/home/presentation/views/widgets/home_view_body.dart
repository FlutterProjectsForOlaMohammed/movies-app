import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/presentation/manager/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/films_list_view.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/text_styles.dart';

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
    BlocProvider.of<FilmsCategoryBloc>(context).add(
      ChooseFilmsCategoryEvent(
        categoryName: showFilmsOptions[0],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
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
    );
  }
}

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
          return const Expanded(
            child: Center(
              child: Text(
                "No Films Found ...",
                style: TextStyles.textStyle19,
              ),
            ),
          );
        }
      } else if (state is FilmsCategoryFailure) {
        return Expanded(
          child: Center(
            child: Text(
              state.errMessage,
              style: TextStyles.textStyle19,
            ),
          ),
        );
      } else {
        return const Expanded(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      }
    });
  }
}

class CategoryNameOfFilms extends StatelessWidget {
  const CategoryNameOfFilms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<FilmsCategoryBloc, FilmsCategoryState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50)),
              child: (state is FilmsCategorySuccess)
                  ? Text(
                      state.categoryName,
                      style: TextStyles.textStyle18,
                    )
                  : const Text(
                      "",
                      style: TextStyles.textStyle18,
                    ),
            );
          },
        ),
        const SizedBox(
          width: 62,
        ),
      ],
    );
  }
}
