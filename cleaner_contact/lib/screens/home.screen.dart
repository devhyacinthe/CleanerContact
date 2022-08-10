import 'package:cleaner_contact/widgets/button.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/body.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(),
      body: BodyWidget(),
      bottomNavigationBar: BottomButton(),
    );
  }
}
