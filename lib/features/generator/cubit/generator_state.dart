part of 'generator_cubit.dart';

class GeneratorState {
  final String text;
  final bool isQrCode;

  GeneratorState({
    this.text = '',
    this.isQrCode = true,
  });

  GeneratorState copyWith({
    String? text,
    bool? isQrCode,
  }) {
    return GeneratorState(
      text: text ?? this.text,
      isQrCode: isQrCode ?? this.isQrCode,
    );
  }
}
