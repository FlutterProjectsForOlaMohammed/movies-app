import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';

class FilmImage extends StatelessWidget {
  const FilmImage({
    super.key,
    required this.film,
  });
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: film.id.toString(),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.42,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            "https://image.tmdb.org/t/p/w500${film.posterPath}",
            fit: BoxFit.fill,
          )),
    );
  }
}
