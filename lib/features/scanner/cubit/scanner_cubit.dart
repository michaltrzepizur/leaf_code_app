// Importuje bazową klasę Cubit i rozszerzoną klasę BlocBase
import 'package:flutter_bloc/flutter_bloc.dart';
// Importuje definicję stanu, która nie używa już 'part'
import 'package:leaf_code_app/features/scanner/cubit/scanner_state.dart';
// Importuje model danych
import 'package:leaf_code_app/features/scanner/cubit/scanner_model.dart';

// UWAGA: Usunąłem 'part of 'scanner_state.dart';'. 
// Ten plik jest teraz w pełni niezależny.

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerState.initial());

  /// Metoda symulująca skanowanie kodu i przetwarzanie danych.
  Future<void> scanCode(String data) async {
    if (data.isEmpty) {
      // W przypadku braku danych, resetujemy stan do początkowego.
      emit(const ScannerState.initial());
      return;
    }

    // Włączamy stan ładowania.
    emit(ScannerState.loading(scannedData: data));

    // Symulacja operacji sieciowej/procesowania danych.
    await Future.delayed(const Duration(seconds: 2));

    try {
      // Prosta logika rozpoznawania typu danych
      if (data.startsWith('http')) {
        // Logika bezpieczeństwa
        final bool isSafe = data.contains('google') ||
            data.contains('flutter') ||
            data.contains('example');

        emit(
          ScannerState.success(
            result: ScanResultModel.url(
              url: data,
              isSafe: isSafe,
            ),
          ),
        );
      } else if (data.length == 13 && int.tryParse(data) != null) {
        // Symulacja wyniku dla kodu kreskowego EAN-13
        emit(
          ScannerState.success(
            result: ScanResultModel.product(
              barcode: data,
              productName: 'Kawa Ziarnista Premium',
              productDetails:
                  'Wysokiej jakości kawa, palona we Włoszech. Opakowanie 250g.',
            ),
          ),
        );
      } else {
        // Wszystko inne traktujemy jako zwykły tekst.
        emit(
          ScannerState.success(
            result: ScanResultModel.text(text: data),
          ),
        );
      }
    } catch (e) {
      // W przypadku nieoczekiwanego błędu
      emit(
        ScannerState.failure(
          message: 'Błąd przetwarzania danych skanowania: ${e.toString()}',
        ),
      );
    }
  }

  /// Metoda do powrotu do początkowego stanu.
  void resetState() {
    emit(const ScannerState.initial());
  }
}
