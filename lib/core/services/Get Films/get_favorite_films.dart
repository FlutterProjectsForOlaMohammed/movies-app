import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/helper/api.dart';

class GetFavoriteFilms {
  getFilms() async {
    var response = await Api().getRequest(
      url: "/trending/movie/week?language=en-US",
    );

    return response.fold((l) {
      List<FilmModel> films = [];
      for (int i = 0; i < l.length; i++) {
        films.add(FilmModel.fromMap(l[i]));
      }
      return films;
    }, (r) {
      return r;
    });
  }
}
