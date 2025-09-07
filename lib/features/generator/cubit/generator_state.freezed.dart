// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeneratorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String qrCodeData, String barcodeData, bool isQrCode)
        success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorInitial value) initial,
    required TResult Function(GeneratorSuccess value) success,
    required TResult Function(GeneratorFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorInitial value)? initial,
    TResult? Function(GeneratorSuccess value)? success,
    TResult? Function(GeneratorFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorInitial value)? initial,
    TResult Function(GeneratorSuccess value)? success,
    TResult Function(GeneratorFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneratorStateCopyWith<$Res> {
  factory $GeneratorStateCopyWith(
          GeneratorState value, $Res Function(GeneratorState) then) =
      _$GeneratorStateCopyWithImpl<$Res, GeneratorState>;
}

/// @nodoc
class _$GeneratorStateCopyWithImpl<$Res, $Val extends GeneratorState>
    implements $GeneratorStateCopyWith<$Res> {
  _$GeneratorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GeneratorInitialImplCopyWith<$Res> {
  factory _$$GeneratorInitialImplCopyWith(_$GeneratorInitialImpl value,
          $Res Function(_$GeneratorInitialImpl) then) =
      __$$GeneratorInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeneratorInitialImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorInitialImpl>
    implements _$$GeneratorInitialImplCopyWith<$Res> {
  __$$GeneratorInitialImplCopyWithImpl(_$GeneratorInitialImpl _value,
      $Res Function(_$GeneratorInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GeneratorInitialImpl implements GeneratorInitial {
  const _$GeneratorInitialImpl();

  @override
  String toString() {
    return 'GeneratorState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeneratorInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String qrCodeData, String barcodeData, bool isQrCode)
        success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorInitial value) initial,
    required TResult Function(GeneratorSuccess value) success,
    required TResult Function(GeneratorFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorInitial value)? initial,
    TResult? Function(GeneratorSuccess value)? success,
    TResult? Function(GeneratorFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorInitial value)? initial,
    TResult Function(GeneratorSuccess value)? success,
    TResult Function(GeneratorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GeneratorInitial implements GeneratorState {
  const factory GeneratorInitial() = _$GeneratorInitialImpl;
}

/// @nodoc
abstract class _$$GeneratorSuccessImplCopyWith<$Res> {
  factory _$$GeneratorSuccessImplCopyWith(_$GeneratorSuccessImpl value,
          $Res Function(_$GeneratorSuccessImpl) then) =
      __$$GeneratorSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrCodeData, String barcodeData, bool isQrCode});
}

/// @nodoc
class __$$GeneratorSuccessImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorSuccessImpl>
    implements _$$GeneratorSuccessImplCopyWith<$Res> {
  __$$GeneratorSuccessImplCopyWithImpl(_$GeneratorSuccessImpl _value,
      $Res Function(_$GeneratorSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCodeData = null,
    Object? barcodeData = null,
    Object? isQrCode = null,
  }) {
    return _then(_$GeneratorSuccessImpl(
      qrCodeData: null == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeData: null == barcodeData
          ? _value.barcodeData
          : barcodeData // ignore: cast_nullable_to_non_nullable
              as String,
      isQrCode: null == isQrCode
          ? _value.isQrCode
          : isQrCode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GeneratorSuccessImpl implements GeneratorSuccess {
  const _$GeneratorSuccessImpl(
      {required this.qrCodeData,
      required this.barcodeData,
      required this.isQrCode});

  @override
  final String qrCodeData;
  @override
  final String barcodeData;
  @override
  final bool isQrCode;

  @override
  String toString() {
    return 'GeneratorState.success(qrCodeData: $qrCodeData, barcodeData: $barcodeData, isQrCode: $isQrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorSuccessImpl &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
            (identical(other.barcodeData, barcodeData) ||
                other.barcodeData == barcodeData) &&
            (identical(other.isQrCode, isQrCode) ||
                other.isQrCode == isQrCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, qrCodeData, barcodeData, isQrCode);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratorSuccessImplCopyWith<_$GeneratorSuccessImpl> get copyWith =>
      __$$GeneratorSuccessImplCopyWithImpl<_$GeneratorSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String qrCodeData, String barcodeData, bool isQrCode)
        success,
    required TResult Function(String message) failure,
  }) {
    return success(qrCodeData, barcodeData, isQrCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(qrCodeData, barcodeData, isQrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(qrCodeData, barcodeData, isQrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorInitial value) initial,
    required TResult Function(GeneratorSuccess value) success,
    required TResult Function(GeneratorFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorInitial value)? initial,
    TResult? Function(GeneratorSuccess value)? success,
    TResult? Function(GeneratorFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorInitial value)? initial,
    TResult Function(GeneratorSuccess value)? success,
    TResult Function(GeneratorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GeneratorSuccess implements GeneratorState {
  const factory GeneratorSuccess(
      {required final String qrCodeData,
      required final String barcodeData,
      required final bool isQrCode}) = _$GeneratorSuccessImpl;

  String get qrCodeData;
  String get barcodeData;
  bool get isQrCode;

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratorSuccessImplCopyWith<_$GeneratorSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneratorFailureImplCopyWith<$Res> {
  factory _$$GeneratorFailureImplCopyWith(_$GeneratorFailureImpl value,
          $Res Function(_$GeneratorFailureImpl) then) =
      __$$GeneratorFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeneratorFailureImplCopyWithImpl<$Res>
    extends _$GeneratorStateCopyWithImpl<$Res, _$GeneratorFailureImpl>
    implements _$$GeneratorFailureImplCopyWith<$Res> {
  __$$GeneratorFailureImplCopyWithImpl(_$GeneratorFailureImpl _value,
      $Res Function(_$GeneratorFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GeneratorFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneratorFailureImpl implements GeneratorFailure {
  const _$GeneratorFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GeneratorState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratorFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneratorFailureImplCopyWith<_$GeneratorFailureImpl> get copyWith =>
      __$$GeneratorFailureImplCopyWithImpl<_$GeneratorFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            String qrCodeData, String barcodeData, bool isQrCode)
        success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String qrCodeData, String barcodeData, bool isQrCode)?
        success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratorInitial value) initial,
    required TResult Function(GeneratorSuccess value) success,
    required TResult Function(GeneratorFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GeneratorInitial value)? initial,
    TResult? Function(GeneratorSuccess value)? success,
    TResult? Function(GeneratorFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratorInitial value)? initial,
    TResult Function(GeneratorSuccess value)? success,
    TResult Function(GeneratorFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class GeneratorFailure implements GeneratorState {
  const factory GeneratorFailure({required final String message}) =
      _$GeneratorFailureImpl;

  String get message;

  /// Create a copy of GeneratorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneratorFailureImplCopyWith<_$GeneratorFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
