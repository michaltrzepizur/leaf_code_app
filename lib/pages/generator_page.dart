import 'package:flutter/material.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator Kodów'),
        backgroundColor: Colors.black, // Opcjonalnie: dostosuj kolory
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Tutaj będzie generator kodów QR/kreskowych.',
          style: TextStyle(color: Colors.white), // Dopasowanie do tła
        ),
      ),
      backgroundColor: Colors.black, // Dopasowanie do tła
    );
  }
}