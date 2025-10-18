import 'package:http/http.dart' as http;
import 'dart:developer'; // Zastępuje print, aby usunąć ostrzeżenie lintera

// Serwis do sprawdzania URL - zawiera logikę biznesową niezależną od Fluttera.
class UrlCheckerService {
  // Weryfikacja formatu
  bool _isUrl(String data) {
    // Prosta heurystyka sprawdzająca, czy ciąg znaków wygląda jak URL
    return data.startsWith('http://') || data.startsWith('https://') || data.startsWith('www.');
  }

  // Właściwa logika sprawdzająca bezpieczeństwo (dostępność HTTP)
  Future<bool> _checkUrlSafety(String url) async {
    // 1. Upewnienie się, że URL ma http/https
    String checkedUrl = url.startsWith('http') ? url : 'https://$url';

    try {
      // 2. Wysyłamy zapytanie HEAD (szybsze niż GET)
      final response = await http.head(Uri.parse(checkedUrl)).timeout(const Duration(seconds: 5));

      // 3. Sprawdzamy status HTTP
      if (response.statusCode >= 200 && response.statusCode < 400) {
        // Symulacja "niebezpieczeństwa" dla linków testowych w celach demonstracyjnych
        if (url.toLowerCase().contains('test') || url.toLowerCase().contains('malicious')) {
          return false;
        }
        return true;
      } else {
        // Status 400+: Strona niedostępna
        return false;
      }
    } catch (e) {
      // Błąd: Timeout, problem z połączeniem, nieprawidłowy format URL.
      // Używamy log do rejestrowania błędów, zamiast print()
      log('Błąd weryfikacji URL: $e');
      return false;
    }
  }

  // 🚀 KLUCZOWA METODA DLA CUBITA
  // Przetwarza dane, zwracając strukturę, którą Cubit wykorzysta do emitowania stanu.
  Future<Map<String, dynamic>> processData(String data) async {
    if (_isUrl(data)) {
      final isSafe = await _checkUrlSafety(data);
      // Jeśli to URL, zwracamy status bezpieczeństwa
      return {'type': 'url', 'value': data, 'isSafe': isSafe};
    } else {
      // Jeśli to zwykły tekst, traktujemy go jako czysty tekst
      return {'type': 'text', 'value': data};
    }
  }
}
