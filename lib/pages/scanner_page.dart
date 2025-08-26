import 'package:flutter/material.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skaner Kodów'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Tutaj będzie skaner kodów QR/kreskowych.',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}