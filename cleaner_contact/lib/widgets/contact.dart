import 'dart:typed_data';

import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/contact.provider.dart';

class ContactWidget extends StatefulWidget {
  final String? name;
  final String? numero;
  final Uint8List? image;
  final int index;

  const ContactWidget(
      {Key? key,
      required this.name,
      required this.numero,
      required this.image,
      required this.index})
      : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProvider =
        Provider.of<ContactProvider>(context, listen: false);

    return Consumer<ContactProvider>(
      builder: ((context, value, child) {
        return Card(
          elevation: 2,
          child: ListTile(
            leading: (widget.image == null)
                ? CircleAvatar(
                    maxRadius: 27,
                    backgroundColor: contactProvider.selectedContacts.isNotEmpty
                        ? secondaryColor
                        : primaryColor,
                    child: Text(
                      widget.name!.split('')[0],
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
                : CircleAvatar(
                    backgroundImage: MemoryImage(widget.image!),
                    maxRadius: 27,
                  ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    if (isSelected) {
                      isSelected = !isSelected;
                      contactProvider.removeToSelectedContacts(
                          contactProvider.contactsList[widget.index]);
                      //print(contactProvider.selectedContacts);
                    } else {
                      isSelected = !isSelected;
                      contactProvider.addToSelectedContacts(
                          contactProvider.contactsList[widget.index]);
                      //print(contactProvider.selectedContacts);
                    }
                  });
                },
                icon: !isSelected
                    ? const Icon(Icons.circle_outlined)
                    : const Icon(
                        Icons.circle,
                        color: secondaryColor,
                      )),
            title: Text(widget.name!,
                style: GoogleFonts.aBeeZee(
                    fontSize: 23,
                    color: textColor,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(widget.numero!,
                style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.bold)),
          ),
        );
      }),
    );
  }
}
