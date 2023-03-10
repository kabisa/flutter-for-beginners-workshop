import 'package:flutter/material.dart';
import 'package:flutter_for_beginners_workshop/presentation/solution/home_screen.dart';
import 'package:flutter_for_beginners_workshop/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const HomeScreen(title: 'Kudos'),
    );
  }
}
