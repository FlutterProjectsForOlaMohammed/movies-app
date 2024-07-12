import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({
    super.key,
    required this.film,
  });
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.filmDetailsView, extra: film);
      },
      child: Container(
        height: 220,
        width: 170,
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(70),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: film.id.toString(),
              child: Container(
                height: 160,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500${film.posterPath}",
                        ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                film.title!,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
