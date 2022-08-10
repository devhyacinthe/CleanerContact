import 'package:cleaner_contact/constants/colors.dart';
import 'package:cleaner_contact/widgets/contact.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: const [
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                      ContactWidget(),
                    ],
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: primaryColor, blurRadius: 5)],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          ),
        ),
      ],
    );
  }
}
