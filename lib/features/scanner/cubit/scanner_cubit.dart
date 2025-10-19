import 'package:bloc/bloc.dart';
import '../models/scan_result_model.dart';
import '../../../services/url_checker_service.dart';
import 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  final UrlCheckerService _urlCheckerService;

  // Zmienna blokująca wielokrotne, szybkie skanowanie
  bool _isScanningBlocked = false;

  ScannerCubit(this._urlCheckerService) : super(const ScannerState.initial());

  Future<void> scanCode(String rawCode) async {
    // Jeśli skanowanie jest zablokowane (po udanym skanie), przerywamy
    if (_isScanningBlocked) return;

    emit(const ScannerState.loading());

    try {
      if (Uri.tryParse(rawCode)?.isAbsolute == true) {
        // To jest URL

        // 🚨 POPRAWKA 1: Zmieniamy 'checkUrl' na poprawną 'fetchUrlStatus'
        final urlStatus = await _urlCheckerService.fetchUrlStatus(rawCode);

        // Blokujemy dalsze skanowanie po sukcesie
        _isScanningBlocked = true;

        // 🚨 POPRAWKA 2: Dodajemy argument 'result' do success
        emit(ScannerState.success(
          result: ScanResultModel.url(
            // <--- DODANY required 'result:'
            url: rawCode,
            isSafe: urlStatus.maybeWhen(
              safe: () => true,
              orElse: () => false,
            ),
          ),
        ));
      } else {
        // To jest zwykły tekst

        // Blokujemy dalsze skanowanie po sukcesie
        _isScanningBlocked = true;

        // 🚨 POPRAWKA 3: Dodajemy argument 'result' do success
        emit(ScannerState.success(
          result: ScanResultModel.text(
              text: rawCode), // <--- DODANY required 'result:'
        ));
      }
    } catch (e) {
      // W przypadku błędu odblokowujemy, by spróbować ponownie
      _isScanningBlocked = false;

      // 🚨 POPRAWKA 4: Dodajemy argument 'message' do failure
      emit(ScannerState.failure(
          message: e.toString())); // <--- DODANY required 'message:'
    }
  }

  // Metoda publiczna do resetowania stanu skanera
  void resetScanner() {
    _isScanningBlocked = false;
    emit(const ScannerState.initial());
  }
}
