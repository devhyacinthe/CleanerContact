import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/contact.provider.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    ContactProvider contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    return Consumer<ContactProvider>(builder: ((context, value, child) {
      if (value.selectedContacts.isEmpty) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
                height: 75,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: primaryColor, blurRadius: 2.0)
                    ],
                    color: contactProvider.selectedContacts.isNotEmpty
                        ? secondaryColor
                        : primaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Expanded(
                    child: Center(
                  child: Text("Supprimer",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: 2,
                      )),
                ))),
          ),
        );
      }
      return GestureDetector(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                  contactProvider.selectedContacts.length > 1
                      ? 'Supprimer ces contacts'
                      : 'Supprimer ce contact',
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor)),
              content: Text(
                  contactProvider.selectedContacts.length > 1
                      ? 'Vous allez supprimer définitevement ces contacts de votre téléphone, Etes-vous sûr de vouloir les supprimer?'
                      : 'Vous allez supprimer définitevement ce contact de votre téléphone, Etes-vous sûr de vouloir le supprimer?',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Non'),
                  child: Text('Non',
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                ),
                TextButton(
                  onPressed: () => {
                    setState(() {
                      contactProvider.deleteSelectedContact();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: primaryColor,
                          content: contactProvider.selectedContacts.length > 1
                              ? Text('Contacts supprimés',
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textColor))
                              : Text('Contact supprimé',
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: textColor)),
                        ),
                      );
                      Navigator.pushNamed(context, '/home');
                    }),
                  },
                  child: Text('Oui',
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor)),
                ),
              ],
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
              height: 75,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: primaryColor, blurRadius: 2.0)
                  ],
                  color: contactProvider.selectedContacts.isNotEmpty
                      ? secondaryColor
                      : primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Expanded(
                  child: Center(
                child: Text("Supprimer",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      letterSpacing: 2,
                    )),
              ))),
        ),
      );
    }));
  }
}
