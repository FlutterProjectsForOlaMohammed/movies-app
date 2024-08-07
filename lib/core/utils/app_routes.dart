import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/home/data/Models/film_model.dart';
import 'package:movie_app/Features/home/presentation/views%20model/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/Features/home/presentation/views/film_details_view.dart';
import 'package:movie_app/Features/home/presentation/views/home_view.dart';
import 'package:movie_app/Features/splash/presentation/views/splash_view.dart';

abstract class AppRoutes {
  static const filmDetailsView = '/filmDetailsView';
  static const homeView = '/homeView';
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => FilmsCategoryBloc(),
            child: const HomeView(),
          );
        },
      ),
      GoRoute(
        path: filmDetailsView,
        builder: (context, state) {
          FilmModel film = state.extra! as FilmModel;
          return FilmDetailsView(film: film);
        },
      )
    ],
  );
}
