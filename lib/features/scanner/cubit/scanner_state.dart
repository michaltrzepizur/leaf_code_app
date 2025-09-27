import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// Upewnij się, że ten import jest poprawny
import 'package:leaf_code_app/features/scanner/cubit/scanner_model.dart';

part 'scanner_state.freezed.dart';
// USUNIĘTO: import 'package:bloc/bloc.dart';
// USUNIĘTO: part 'scanner_cubit.dart';

/// Stan skanera, modelowany za pomocą Freezed.
@freezed
abstract class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = InitialState;

  const factory ScannerState.loading({
    required String scannedData,
  }) = LoadingState;

  const factory ScannerState.success({
    required ScanResultModel result, 
  }) = SuccessState;

  const factory ScannerState.failure({
    required String message,
  }) = FailureState;
}