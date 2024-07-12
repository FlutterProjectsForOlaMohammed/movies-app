import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/services/Share%20Film/share_film_service.dart';
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
              await ShareFilmService().share(film: film);
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
}
