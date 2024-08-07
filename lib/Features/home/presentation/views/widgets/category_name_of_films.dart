import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/presentation/views%20model/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/core/utils/text_styles.dart';

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
                      BlocProvider.of<FilmsCategoryBloc>(context).category,
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
