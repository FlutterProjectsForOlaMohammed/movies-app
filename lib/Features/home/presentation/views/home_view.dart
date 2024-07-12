import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/presentation/manager/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FilmsCategoryBloc(),
        child: const HomeViewBody(),
      ),
    );
  }
}
