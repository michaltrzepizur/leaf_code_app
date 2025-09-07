import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Dodajemy import paczki flutter_bloc
import 'package:leaf_code_app/pages/home_page.dart';
import 'package:leaf_code_app/features/generator/cubit/generator_cubit.dart'; // Importujemy nasz nowy cubit

void main() {
  runApp(const LeafCodeApp());
}

class LeafCodeApp extends StatelessWidget {
  const LeafCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneratorCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leaf Code App',
        theme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
