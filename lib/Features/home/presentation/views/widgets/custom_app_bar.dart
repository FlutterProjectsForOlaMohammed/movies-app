import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Features/home/presentation/views/widgets/show_films_options_list.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const ShowOptionsList(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.film,
            size: 35,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Shoof Film',
            style: GoogleFonts.pacifico(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
