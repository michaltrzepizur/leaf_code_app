import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_code_app/features/scanner/cubit/scanner_state.dart'; 
// NOWE IMPORTY, ABY ROZWIĄZAĆ PROBLEM TYPOWANIA
import 'package:leaf_code_app/features/scanner/models/scan_result_model.dart'; 
import 'package:leaf_code_app/services/url_checker_service.dart';

// 💡 Definicja typu dla funkcji resetującej
typedef CameraResetCallback = void Function();

class ScannerCubit extends Cubit<ScannerState> {
  // 💡 NOWA ZMIENNA DLA WSTRZYKNIĘCIA ZALEŻNOŚCI (DI)
  final UrlCheckerService _urlCheckerService;

  // 💡 ZMIENIONY KONSTRUKTOR: Wymagamy wstrzyknięcia Serwisu
  ScannerCubit(this._urlCheckerService) : super(const ScannerState.initial());

  // 💡 ZMIENNA: Przechowuje funkcję resetującą widżet
  CameraResetCallback? _cameraResetCallback;

  // 💡 METODA: Ustawia callback z widżetu strony skanera
  void setCameraResetCallback(CameraResetCallback callback) {
    _cameraResetCallback = callback;
  }
  
  void scanCode(String code) async {
    // Sprawdzamy, czy stan jest już końcowy (Success lub Failure) 
    // lub trwa ładowanie, aby zablokować wielokrotne skanowanie.
    
    final bool isBlocked = state.maybeWhen(
      success: (_) => true,
      failure: (_) => true,
      loading: () => true,
      orElse: () => false,
    );

    if (isBlocked) {
      return;
    }

    emit(const ScannerState.loading());

    try {
      // Symulacja ładowania
      await Future.delayed(const Duration(seconds: 1));

      // 💡 KLUCZOWA POPRAWKA ROZWIĄZUJĄCA BŁĄD TYPOWANIA:
      // Konwertujemy String na wymagany ScanResultModel.
      final ScanResultModel resultModel = await _processScannedCode(code);
      
      // Tutaj powinna być logika komunikacji z backendem/bazą danych
      if (code == 'TEST_FAIL') {
        // Używamy WYRAŹNIE NAZWANYCH PARAMETRÓW (`message:`)
        emit(const ScannerState.failure(message: 'Nie znaleziono produktu o tym kodzie.'));
      } else {
        // Używamy WYRAŹNIE NAZWANYCH PARAMETRÓW (`result:`)
        emit(ScannerState.success(result: resultModel)); // Przekazujemy gotowy Model
      }
    } catch (e) {
      // Używamy WYRAŹNIE NAZWANYCH PARAMETRÓW (`message:`)
      emit(ScannerState.failure(message: 'Wystąpił nieoczekiwany błąd: ${e.toString()}'));
    }
  }
  
  // 💡 NOWA METODA: Przetwarza zeskanowany kod na model danych
  Future<ScanResultModel> _processScannedCode(String code) async {
    // Prosty regex do weryfikacji URL (możesz go dostosować)
    final urlRegex = RegExp(
        r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
        caseSensitive: false);

    if (urlRegex.hasMatch(code)) {
      // 1. Sprawdzamy bezpieczeństwo URL za pomocą Serwisu
      final isSafe = await _urlCheckerService.isUrlSafe(code);
      return ScanResultModel.url(url: code, isSafe: isSafe);
    } else {
      // 2. Jeśli to nie URL, traktujemy jako zwykły tekst
      return ScanResultModel.text(text: code);
    }
  }

  // Usunięto błędny `@override`.
  void resetScanner() {
    // 💡 KLUCZOWA LOGIKA RESETU WIDŻETU KAMERY
    _cameraResetCallback?.call(); 
    
    // Zmieniamy stan na Initial
    emit(const ScannerState.initial());
  }
}
