import 'package:flutter_bloc/flutter_bloc.dart';
import 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  // Stan początkowy
  GeneratorCubit() : super(const GeneratorState.initial());

  // Metoda, która ZAWSZE zaktualizuje tekst
  void setInputText(String text) {
    if (text.isEmpty) {
      emit(const GeneratorState.initial());
      return;
    }
    
    // Używamy current.maybeWhen, aby zachować poprzedni typ kodu (QR/Barcode)
    final bool wasQrCode = state.maybeWhen(
      success: (_, __, isQr) => isQr,
      orElse: () => true, // Domyślnie QR
    );

    // NAPRAWA: ZAWSZE EMITUJEMY NOWY STAN Sukcesu z nowym tekstem.
    // Zapewnia to, że UI odświeży się nowym tekstem, nawet jeśli przełączamy się
    // między QR a Barcode lub po prostu zmieniamy sam tekst.
    emit(GeneratorState.success(
      qrCodeData: text,
      barcodeData: text,
      isQrCode: wasQrCode,
    ));
  }

  // Metoda do przełączania typu kodu
  void toggleCodeType(bool isQrCode) {
    state.maybeWhen(
      success: (qr, barcode, _) {
        // Emitujemy nowy stan, zachowując dane, ale zmieniając typ kodu
        emit(GeneratorState.success(
          qrCodeData: qr,
          barcodeData: barcode,
          isQrCode: isQrCode,
        ));
      },
      // Jeśli nie jesteśmy w stanie Success, nie robimy nic
      orElse: () {},
    );
  }
}
