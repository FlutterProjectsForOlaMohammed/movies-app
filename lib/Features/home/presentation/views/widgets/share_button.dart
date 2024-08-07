import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/data/Repos/home_repo_implementation.dart';
import 'package:movie_app/core/Functions/show_message.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:movie_app/core/utils/text_styles.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.film,
  });
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () async {
              await shareFilm();
            },
            child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: const Text(
                  "Share",
                  style: TextStyles.textStyle19,
                )),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<void> shareFilm() async {
    var tailerKey = await getIt<HomeRepoImplementation>()
        .getFilmTailer(filmID: film.id.toString());
    tailerKey.fold((l) async {
      await getIt<HomeRepoImplementation>().shareFilm(film: film, tailerKey: l);
    }, (r) {
      showMessage(text: r.errMessage);
    });
  }
}
