import 'package:flutter/material.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({
    super.key,
    required this.isEnable,
  });

  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white.withOpacity(0.5),
      child: Icon(
        Icons.play_arrow_rounded,
        size: 80,
        color: (isEnable)
            ? Colors.black.withOpacity(0.8)
            : Colors.black.withOpacity(0.6),
      ),
    );
  }
}
