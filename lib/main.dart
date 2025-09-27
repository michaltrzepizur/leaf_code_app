import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_code_app/pages/home_page.dart'; // Upewnij się, że ścieżka do HomePage jest poprawna
import 'package:leaf_code_app/features/generator/cubit/generator_cubit.dart'; // Importujemy GeneratorCubit

void main() {
  runApp(const LeafCodeApp());
}

class LeafCodeApp extends StatelessWidget {
  const LeafCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Używamy GeneratorCubit na najwyższym poziomie
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
