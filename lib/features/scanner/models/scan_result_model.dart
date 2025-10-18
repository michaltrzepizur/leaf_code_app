import 'package:freezed_annotation/freezed_annotation.dart';

// Używamy Freezed dla czystego i bezpiecznego zarządzania wariantami danych.
// Ta linia powoduje błąd "Target of URI doesn't exist", dopóki nie uruchomisz build_runnera.
part 'scan_result_model.freezed.dart'; 

@freezed
class ScanResultModel with _$ScanResultModel {
  // Wariant 1: Zwykły tekst (np. numer telefonu, fragment tekstu)
  const factory ScanResultModel.text({
    required String text,
  }) = _ScanResultModelText;

  // Wariant 2: Adres URL (zawiera status bezpieczeństwa)
  const factory ScanResultModel.url({
    required String url,
    required bool isSafe, // Informacja o bezpieczeństwie z UrlCheckerService
  }) = _ScanResultModelUrl;
}
