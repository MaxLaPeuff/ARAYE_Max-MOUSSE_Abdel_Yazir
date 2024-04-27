import 'package:flutter/material.dart';
import 'pages/home_candidate_page.dart';
import 'pages/add_candidate_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iut Training',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0x00B7E5E0)),
        useMaterial3: true,
      ),
      home: HomeCandidatePage(),
      routes: {},
      debugShowCheckedModeBanner: false,
    );
  }
}
