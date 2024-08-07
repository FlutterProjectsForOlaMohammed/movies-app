import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/film_general_info.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/film_image.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/play_tailer.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/share_button.dart';

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
                height: 32,
              ),
              FilmGeneralInfo(film: film),
            ],
          ),
        ),
        ShareButton(film: film),
      ],
    );
  }
}
