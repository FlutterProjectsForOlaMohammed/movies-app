import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/film_item.dart';

class FilmsListView extends StatelessWidget {
  const FilmsListView({
    super.key,
    required this.films,
  });
  final List<FilmModel> films;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        itemCount: films.length,
        itemBuilder: (context, index) {
          return FilmItem(
            film: films[index],
          );
        },
      ),
    );
  }
}
