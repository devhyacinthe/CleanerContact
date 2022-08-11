import 'package:cleaner_contact/screens/home.screen.dart';
import 'package:cleaner_contact/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/contact.provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleaner Contact',
      routes: {'/home': (_) => const Home()},
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
