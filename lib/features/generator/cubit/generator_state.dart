import 'package:freezed_annotation/freezed_annotation.dart';

part 'generator_state.freezed.dart';

@freezed
abstract class GeneratorState with _$GeneratorState {
  const factory GeneratorState.initial() = GeneratorInitial;
  const factory GeneratorState.success({
    required String qrCodeData,
    required String barcodeData,
    required bool isQrCode,
  }) = GeneratorSuccess;
  const factory GeneratorState.failure({
    required String message,
  }) = GeneratorFailure;
}
