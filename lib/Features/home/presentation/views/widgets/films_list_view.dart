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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.71,
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
