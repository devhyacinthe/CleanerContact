import 'package:cleaner_contact/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
            height: 75,
            width: 150,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(color: primaryColor, blurRadius: 2.0)
            ], color: primaryColor, borderRadius: BorderRadius.circular(12)),
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
}
