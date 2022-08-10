import 'dart:typed_data';

import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactWidget extends StatefulWidget {
  final String? name;
  final String? numero;
  final Uint8List? image;

  const ContactWidget(
      {Key? key, required this.name, required this.numero, required this.image})
      : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: (widget.image == null)
            ? CircleAvatar(child: Text(widget.name!.split('')[0]))
            : CircleAvatar(
                backgroundImage: MemoryImage(widget.image!),
                maxRadius: 27,
              ),
        trailing: IconButton(
            onPressed: () {}, icon: const Icon(Icons.circle_outlined)),
        title: Text(widget.name!,
            style: GoogleFonts.aBeeZee(
                fontSize: 23, color: textColor, fontWeight: FontWeight.bold)),
        subtitle: Text(widget.numero!,
            style: GoogleFonts.aBeeZee(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
