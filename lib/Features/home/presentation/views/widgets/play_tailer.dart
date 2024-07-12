import 'package:flutter/material.dart';
import 'package:movie_app/core/services/Get%20FilmTailer/get_film_tailer.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayTailer extends StatelessWidget {
  const PlayTailer({
    super.key,
    required this.filmID,
  });
  final int filmID;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.75,
      bottom: -MediaQuery.of(context).size.height / 20,
      child: IconButton(
          onPressed: () async {
            await getTailer(filmID: filmID);
          },
          icon: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white.withOpacity(0.5),
            child: Icon(
              Icons.play_arrow_rounded,
              size: 80,
              color: Colors.black.withOpacity(0.8),
            ),
          )),
    );
  }

  Future<void> getTailer({required int filmID}) async {
    String tailerKey = await GetFilmTailer().getTailer(filmID: filmID);
    String vedioKey = 'https://www.youtube.com/watch?v=$tailerKey';
    await launchUrl(
      mode: LaunchMode.externalApplication,
      Uri.parse(vedioKey),
    );
  }
}
