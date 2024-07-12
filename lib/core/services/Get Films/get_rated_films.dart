import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/core/helper/api.dart';

class GetRatedFilms {
  getFilms() async {
    var response = await Api().getRequest(
      url:
          "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200",
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
