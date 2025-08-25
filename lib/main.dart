import 'package:flutter/material.dart';
import 'package:leaf_code_app/pages/home_page.dart';

void main() {
  runApp(const LeafCodeApp());
}

class LeafCodeApp extends StatelessWidget {
  const LeafCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaf Code App',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
