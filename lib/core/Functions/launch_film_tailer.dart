import 'package:movie_app/Features/home/data/Repos/home_repo_implementation.dart';
import 'package:movie_app/core/Functions/show_message.dart';
import 'package:movie_app/core/utils/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> launchFilmTailer({required int filmID}) async {
  try {
    var tailerKey = await getIt<HomeRepoImplementation>().getFilmTailer(
      filmID: filmID.toString(),
    );
    return tailerKey.fold(
      (tailer) async {
        String vedioKey = 'https://www.youtube.com/watch?v=$tailer';
        bool launch = await canLaunchUrl(
          Uri.parse(vedioKey),
        );
        if (launch) {
          await launchUrl(
            mode: LaunchMode.externalApplication,
            Uri.parse(vedioKey),
          );
          return true;
        } else {
          showMessage(text: "Can Not Launch This Url ... ");
          return false;
        }
      },
      (error) {
        showMessage(
          text: error.errMessage,
        );
        return true;
      },
    );
  } on Exception catch (e) {
    showMessage(
      text: e.toString(),
    );
    return false;
  }
}
