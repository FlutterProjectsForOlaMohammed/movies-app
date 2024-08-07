import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/loading.dart';

class HomeFilmImage extends StatelessWidget {
  const HomeFilmImage({super.key, required this.film});
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        height: 160,
        width: 150,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 32,
        ),
        imageUrl: "https://image.tmdb.org/t/p/w500${film.posterPath}",
      ),
    );
  }
}
