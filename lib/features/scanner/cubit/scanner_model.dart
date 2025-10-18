import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_model.freezed.dart';

/// Model reprezentujący wynik skanowania, który może być jednym z kilku typów.
/// Używamy Freezed do tworzenia klas 'sum' (Sealed Classes).
@freezed
abstract class ScanResultModel with _$ScanResultModel {
  /// Wynik to URL.
  const factory ScanResultModel.url({
    required String url,
    required bool isSafe,
  }) = UrlResult;

  /// Wynik to kod produktu.
  const factory ScanResultModel.product({
    required String barcode,
    required String productName,
    required String productDetails,
  }) = ProductResult;

  /// Wynik to zwykły tekst.
  const factory ScanResultModel.text({
    required String text,
  }) = TextResult;
}

// Opcjonalna metoda pomocnicza (nie generowana przez Freezed)
extension ScanResultModelX on ScanResultModel {
  /// Zwraca tytuł pasujący do typu zeskanowanych danych.
  String get title {
    return map(
      url: (_) => 'Zeskanowany Link URL',
      product: (_) => 'Zeskanowany Produkt',
      text: (_) => 'Zeskanowany Zwykły Tekst',
    );
  }
}
