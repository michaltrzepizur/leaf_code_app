import 'package:http/http.dart' as http;
import 'dart:developer';
import '../features/scanner/models/url_status_model.dart'; // <--- KLUCZOWY IMPORT

// Serwis do sprawdzania URL. Zawiera logikę biznesową weryfikacji linków.
class UrlCheckerService {
  // Weryfikacja formatu (upewnienie się, że to URL)
  bool _isUrl(String data) {
    return data.startsWith('http') || data.startsWith('www.');
  }

  // Właściwa logika sprawdzająca bezpieczeństwo (dostępność HTTP)
  Future<UrlStatusModel> _checkUrlSafety(String url) async {
    // 1. Upewnienie się, że URL ma http/https
    String checkedUrl = url.startsWith('http') ? url : 'https://$url';

    try {
      // 2. Wysyłamy zapytanie HEAD (szybsze niż GET)
      final response = await http
          .head(Uri.parse(checkedUrl))
          .timeout(const Duration(seconds: 5));

      // 3. Sprawdzamy status HTTP
      if (response.statusCode >= 200 && response.statusCode < 400) {
        // Symulacja "niebezpieczeństwa" dla linków testowych w celach demonstracyjnych
        if (url.toLowerCase().contains('test') ||
            url.toLowerCase().contains('malicious')) {
          return const UrlStatusModel.malicious();
        }
        return const UrlStatusModel.safe();
      } else {
        // Status 400+: Strona niedostępna
        return const UrlStatusModel.unknown();
      }
    } catch (e) {
      // Błąd: Timeout, problem z połączeniem, nieprawidłowy format URL.
      log('Błąd weryfikacji URL: $e');
      return const UrlStatusModel.unknown();
    }
  }

  // 🚀 KLUCZOWA METODA DLA CUBITA
  Future<UrlStatusModel> fetchUrlStatus(String data) async {
    if (_isUrl(data)) {
      return _checkUrlSafety(data);
    } else {
      // Jeśli nie wygląda jak URL, traktujemy jako tekst (bezpieczny)
      return const UrlStatusModel.safe();
    }
  }
}
