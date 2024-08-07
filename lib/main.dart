import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/observer/simple_bloc_observer.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/core/utils/service_locator.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setup();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          textTheme: GoogleFonts.prataTextTheme(ThemeData.dark().textTheme),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: kPrimaryColor),
      routerConfig: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
