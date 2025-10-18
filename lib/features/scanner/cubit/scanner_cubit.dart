import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/url_checker_service.dart'; // Serwis z Kroku 1
import '../models/scan_result_model.dart'; // Model z Kroku 2.1
import 'scanner_state.dart'; // Stany z Kroku 2.2

class ScannerCubit extends Cubit<ScannerState> {
  // Wstrzykiwanie zależności: Cubit potrzebuje UrlCheckerService
  final UrlCheckerService _urlCheckerService;

  // Konstruktor: Ustawiamy stan początkowy
  ScannerCubit(this._urlCheckerService) : super(const ScannerState.initial());

  // Główna funkcja wywoływana przez ScannerPage
  Future<void> scanCode(String data) async {
    if (data.isEmpty) return;

    // 1. Poinformuj UI, że zaczynamy pracę
    emit(const ScannerState.loading());

    try {
      // 2. Wywołaj logikę biznesową (Serwis URL rozpoznaje typ i bezpieczeństwo)
      final processedData = await _urlCheckerService.processData(data);

      // 3. Konwertuj Mapę na Model Freezed
      final ScanResultModel result;
      if (processedData['type'] == 'url') {
        result = ScanResultModel.url(
          url: processedData['value'] as String,
          isSafe: processedData['isSafe'] as bool,
        );
      } else {
        result = ScanResultModel.text(
          text: processedData['value'] as String,
        );
      }

      // 4. Poinformuj UI o sukcesie
      emit(ScannerState.success(result: result));

      // Opcjonalnie: Po 4 sekundach wróć do stanu initial, by umożliwić kolejne skanowanie
      await Future.delayed(const Duration(seconds: 4));
      emit(const ScannerState.initial());

    } catch (e) {
      // 5. Poinformuj UI o błędzie
      emit(ScannerState.failure(message: 'Nie udało się przetworzyć danych: $e'));
    }
  }
  
  // Metoda do powrotu do początkowego stanu (używana po sukcesie)
  void resetState() {
    emit(const ScannerState.initial());
  }
}
