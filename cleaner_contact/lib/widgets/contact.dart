import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
          maxRadius: 27,
        ),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.circle_outlined)),
        title: Text("heol",
            style: GoogleFonts.aBeeZee(
                fontSize: 23, color: textColor, fontWeight: FontWeight.bold)),
        subtitle: Text("hkh",
            style: GoogleFonts.aBeeZee(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
