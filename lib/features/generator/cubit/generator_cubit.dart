import 'package:flutter_bloc/flutter_bloc.dart';

part 'generator_state.dart';

// Klasa Cubit, która będzie zarządzać stanem naszej aplikacji.
class GeneratorCubit extends Cubit<GeneratorState> {
  // Konstruktor, który inicjuje stan początkowy.
  GeneratorCubit() : super(GeneratorState());

  // Metoda do ustawiania wartości tekstu.
  void setInputText(String text) {
    emit(state.copyWith(text: text));
  }

  // Metoda do przełączania typu kodu (QR lub Kod Kreskowy).
  void toggleCodeType(bool isQrCode) {
    emit(state.copyWith(isQrCode: isQrCode));
  }
}
