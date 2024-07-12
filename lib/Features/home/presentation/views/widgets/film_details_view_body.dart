import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/film_image.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/play_tailer.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/share_button.dart';
import 'package:movie_app/core/utils/text_styles.dart';

class FilmDetailsViewBody extends StatelessWidget {
  const FilmDetailsViewBody({super.key, required this.film});
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  FilmImage(film: film),
                  PlayTailer(filmID: film.id!),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  film.title!,
                  style: TextStyles.textStyle30,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  film.overview!,
                  style: TextStyles.textStyle18
                      .copyWith(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  "Release Date : ${film.releaseDate} ",
                  style: TextStyles.textStyle19,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  "Vote Average : ${film.voteAverage}",
                  style: TextStyles.textStyle19,
                ),
              ),
            ],
          ),
        ),
        ShareButton(film: film),
      ],
    );
  }
}
