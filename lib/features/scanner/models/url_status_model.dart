import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_status_model.freezed.dart';

@freezed
class UrlStatusModel with _$UrlStatusModel {
  // Wariant bezpieczny (default dla tekstu i pomyślnej weryfikacji URL)
  const factory UrlStatusModel.safe() = _UrlStatusModelSafe;

  // Wariant niebezpieczny (dla URL-i oznaczonych jako złośliwe)
  const factory UrlStatusModel.malicious() = _UrlStatusModelMalicious;

  // Wariant nieznany (dla błędów sieci/timeoutów)
  const factory UrlStatusModel.unknown() = _UrlStatusModelUnknown;
}
