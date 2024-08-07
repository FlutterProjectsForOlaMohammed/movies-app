import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/home_book_image.dart';
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
        decoration: BoxDecoration(
            color: Colors.white.withAlpha(70),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HomeFilmImage(film: film),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    film.title!,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
