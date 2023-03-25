import 'package:flutter/material.dart';
import 'package:tpm_quiz/game_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prac TPM Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GameList());
  }
}