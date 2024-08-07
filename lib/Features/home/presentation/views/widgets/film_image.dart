import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/loading.dart';

class FilmImage extends StatelessWidget {
  const FilmImage({
    super.key,
    required this.film,
  });
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/w500${film.posterPath}",
        placeholder: (context, url) => const Loading(),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error,
            size: 64,
          ),
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
