import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utils/text_styles.dart';

class ListViewFilmsFailure extends StatelessWidget {
  const ListViewFilmsFailure({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyles.textStyle19,
          ),
        ),
      ),
    );
  }
}
