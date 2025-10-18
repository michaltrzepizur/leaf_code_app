import 'package:flutter/material.dart';
import '../models/scan_result_model.dart'; // Upewnij się, że ścieżka do modelu jest poprawna

class ScanResultDisplay extends StatelessWidget {
  // Ten widżet przyjmuje jako argument wynik z Cubita (ScanResultModel)
  final ScanResultModel result;

  const ScanResultDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // Zmienne, które będą trzymać to, co wyświetlimy
    String content = '';
    Color color = Colors.white;
    IconData icon = Icons.info;
    String safetyInfo = '';

    // Logika, która sprawdza, czy zeskanowany wynik jest URL czy zwykłym tekstem
    result.when(
      text: (text) {
        content = text;
        safetyInfo = 'Zeskanowano czysty tekst.';
        // Dla czystego tekstu zostawiamy domyślne białe kolory
      },
      url: (url, isSafe) {
        content = url;
        // TUTAJ WŁĄCZA SIĘ LOGIKA BEZPIECZEŃSTWA
        if (isSafe) {
          color = Colors.greenAccent;
          icon = Icons.security;
          safetyInfo = 'ADRES URL: BEZPIECZNY';
        } else {
          color = Colors.redAccent;
          icon = Icons.warning;
          safetyInfo = 'ADRES URL: POTENCJALNIE NIEBEZPIECZNY';
        }
      },
    );

    // Budowanie interfejsu
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  safetyInfo,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
