import 'package:flutter_bloc/flutter_bloc.dart';
import 'generator_state.dart';

class GeneratorCubit extends Cubit<GeneratorState> {
  GeneratorCubit() : super(const GeneratorState.initial());

  void setInputText(String text) {
    if (text.isEmpty) {
      emit(const GeneratorState.initial());
      return;
    }

    state.when(
      initial: () {
        emit(GeneratorState.success(
          qrCodeData: text,
          barcodeData: text,
          isQrCode: true,
        ));
      },
      success: (qrCodeData, barcodeData, isQrCode) {
        emit(GeneratorState.success(
          qrCodeData: qrCodeData,
          barcodeData: text,
          isQrCode: isQrCode,
        ));
      },
      failure: (message) {
        emit(GeneratorState.success(
          qrCodeData: text,
          barcodeData: text,
          isQrCode: true,
        ));
      },
    );
  }

  void toggleCodeType(bool isQrCode) {
    state.when(
      initial: () {
        // Ignored if the state is initial
      },
      success: (qrCodeData, barcodeData, _) {
        emit(GeneratorState.success(
          qrCodeData: qrCodeData,
          barcodeData: barcodeData,
          isQrCode: isQrCode,
        ));
      },
      failure: (message) {
        // Ignored if the state is a failure
      },
    );
  }
}
