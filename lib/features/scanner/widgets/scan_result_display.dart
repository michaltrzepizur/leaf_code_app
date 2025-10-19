import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/scan_result_model.dart';
import '../cubit/scanner_cubit.dart'; // Wymagany import!

class ScanResultDisplay extends StatelessWidget {
  final ScanResultModel result;
  final ScannerCubit cubit; // ⬅️ DODAĆ TEN PARAMETR

  // ⬅️ ZAKTUALIZOWAĆ KONSTRUKTOR
  const ScanResultDisplay({super.key, required this.result, required this.cubit}); 

  // Funkcja pomocnicza do kopiowania
  void _copyToClipboard(BuildContext context, String text) async {
    if (!context.mounted) return;
    
    await Clipboard.setData(ClipboardData(text: text));
    
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Skopiowano do schowka!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Funkcja pomocnicza do otwierania URL
  Future<void> _launchUrl(BuildContext context, String url) async {
    // Dodajemy https:// na wypadek braku protokołu
    final safeUrl = url.startsWith('http') ? url : 'https://$url';
    
    final uri = Uri.tryParse(safeUrl);
    
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nie można otworzyć linku: $safeUrl')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: result.map(
        // === Wariant 1: TEKST ===
        text: (textResult) {
          return Column(
            children: [
              Text(
                textResult.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _copyToClipboard(context, textResult.text),
                icon: const Icon(Icons.copy),
                label: const Text('Kopiuj'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              // Przycisk resetu dla tekstu
              ElevatedButton.icon(
                onPressed: cubit.resetScanner,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Skanuj ponownie'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          );
        },
        // === Wariant 2: URL ===
        url: (urlResult) {
          final color = urlResult.isSafe ? Colors.green : Colors.red;
          final icon = urlResult.isSafe ? Icons.security : Icons.warning_amber;
          final safetyText = urlResult.isSafe ? 'BEZPIECZNY' : 'POTENCJALNE ZAGROŻENIE';

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    safetyText,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                urlResult.url,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Przycisk 1: Otwórz URL
                  ElevatedButton.icon(
                    onPressed: () => _launchUrl(context, urlResult.url),
                    icon: const Icon(Icons.open_in_new),
                    label: const Text('Otwórz URL'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Przycisk 2: Kopiuj
                  ElevatedButton.icon(
                    onPressed: () => _copyToClipboard(context, urlResult.url),
                    icon: const Icon(Icons.copy),
                    label: const Text('Kopiuj'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Przycisk resetu dla URL
              ElevatedButton.icon(
                onPressed: cubit.resetScanner,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Skanuj ponownie'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
