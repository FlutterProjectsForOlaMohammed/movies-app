import 'package:flutter/material.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/film_details_view_body.dart';

class FilmDetailsView extends StatelessWidget {
  const FilmDetailsView({super.key, required this.film});
  final FilmModel film;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FilmDetailsViewBody(film: film),
    );
  }
}
