import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utils/text_styles.dart';

class NoFilmsFound extends StatelessWidget {
  const NoFilmsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            "No Films Found ...",
            textAlign: TextAlign.center,
            style: TextStyles.textStyle19,
          ),
        ),
      ),
    );
  }
}
