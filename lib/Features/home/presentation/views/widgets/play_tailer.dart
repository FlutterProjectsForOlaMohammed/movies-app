import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Repos/home_repo_implementation.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/play_icon.dart';
import 'package:movie_app/core/Functions/launch_film_tailer.dart';
import 'package:movie_app/core/utils/service_locator.dart';

class PlayTailer extends StatefulWidget {
  const PlayTailer({
    super.key,
    required this.filmID,
  });
  final int filmID;

  @override
  State<PlayTailer> createState() => _PlayTailerState();
}

class _PlayTailerState extends State<PlayTailer> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.75,
      bottom: -MediaQuery.of(context).size.height / 20,
      child: InkWell(
        onTap: (isEnable)
            ? () async {
                await getIt<HomeRepoImplementation>()
                    .getFilmTailer(filmID: widget.filmID.toString());
                isEnable = await launchFilmTailer(filmID: widget.filmID);
                setState(() {});
              }
            : null,
        child: PlayIcon(isEnable: isEnable),
      ),
    );
  }
}
