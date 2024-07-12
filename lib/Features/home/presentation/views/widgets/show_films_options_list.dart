import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Features/home/presentation/manager/Films%20Category%20Bloc/films_category_bloc.dart';
import 'package:movie_app/core/utils/constants.dart';

class ShowOptionsList extends StatelessWidget {
  const ShowOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor.withOpacity(1))),
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
      ),
      onSelected: (value) {
        BlocProvider.of<FilmsCategoryBloc>(context).add(
          ChooseFilmsCategoryEvent(
            categoryName: value,
          ),
        );
      },
      offset: const Offset(0, 45),
      iconSize: 30,
      itemBuilder: (context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: showFilmsOptions[0],
          child: Text(showFilmsOptions[0],
              style: GoogleFonts.akatab(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
        ),
        PopupMenuItem(
          value: showFilmsOptions[1],
          child: Text(
            showFilmsOptions[1],
            style: GoogleFonts.akatab(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
        PopupMenuItem(
          value: showFilmsOptions[2],
          child: Text(
            showFilmsOptions[2],
            style: GoogleFonts.akatab(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
