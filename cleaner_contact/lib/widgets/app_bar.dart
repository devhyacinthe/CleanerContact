import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Column(
        children: [
          Text(
            "Cleaner Contact",
            style: GoogleFonts.aBeeZee(
                fontSize: 30, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text(
            "(Vous avez 150 contacts)",
            style: GoogleFonts.lato(
                fontSize: 15, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
      centerTitle: true,
      titleTextStyle: const TextStyle(fontStyle: FontStyle.italic),
    );
  }
}
