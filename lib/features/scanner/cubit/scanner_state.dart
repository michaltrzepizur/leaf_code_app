import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/scan_result_model.dart'; // Kluczowy import poprawiony!

part 'scanner_state.freezed.dart';

// Stan skanera, modelowany za pomocą Freezed.
@freezed
class ScannerState with _$ScannerState {
  // Stan początkowy przed skanowaniem
  const factory ScannerState.initial() = _Initial;

  // Stan ładowania (czekanie na wynik UrlCheckerService)
  // UWAGA: Nie potrzebujemy już 'scannedData' w tym stanie
  const factory ScannerState.loading() = _Loading; 

  // Stan sukcesu (wynik gotowy do wyświetlenia)
  const factory ScannerState.success({
    required ScanResultModel result,
  }) = _Success;

  // Stan błędu
  const factory ScannerState.failure({
    required String message,
  }) = _Failure;
}
