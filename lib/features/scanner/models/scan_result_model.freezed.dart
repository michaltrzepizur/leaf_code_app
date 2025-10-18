// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScanResultModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String url, bool isSafe) url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String url, bool isSafe)? url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String url, bool isSafe)? url,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScanResultModelText value) text,
    required TResult Function(_ScanResultModelUrl value) url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScanResultModelText value)? text,
    TResult? Function(_ScanResultModelUrl value)? url,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScanResultModelText value)? text,
    TResult Function(_ScanResultModelUrl value)? url,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanResultModelCopyWith<$Res> {
  factory $ScanResultModelCopyWith(
          ScanResultModel value, $Res Function(ScanResultModel) then) =
      _$ScanResultModelCopyWithImpl<$Res, ScanResultModel>;
}

/// @nodoc
class _$ScanResultModelCopyWithImpl<$Res, $Val extends ScanResultModel>
    implements $ScanResultModelCopyWith<$Res> {
  _$ScanResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ScanResultModelTextImplCopyWith<$Res> {
  factory _$$ScanResultModelTextImplCopyWith(_$ScanResultModelTextImpl value,
          $Res Function(_$ScanResultModelTextImpl) then) =
      __$$ScanResultModelTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$ScanResultModelTextImplCopyWithImpl<$Res>
    extends _$ScanResultModelCopyWithImpl<$Res, _$ScanResultModelTextImpl>
    implements _$$ScanResultModelTextImplCopyWith<$Res> {
  __$$ScanResultModelTextImplCopyWithImpl(_$ScanResultModelTextImpl _value,
      $Res Function(_$ScanResultModelTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$ScanResultModelTextImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanResultModelTextImpl implements _ScanResultModelText {
  const _$ScanResultModelTextImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'ScanResultModel.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanResultModelTextImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanResultModelTextImplCopyWith<_$ScanResultModelTextImpl> get copyWith =>
      __$$ScanResultModelTextImplCopyWithImpl<_$ScanResultModelTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String url, bool isSafe) url,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String url, bool isSafe)? url,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String url, bool isSafe)? url,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScanResultModelText value) text,
    required TResult Function(_ScanResultModelUrl value) url,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScanResultModelText value)? text,
    TResult? Function(_ScanResultModelUrl value)? url,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScanResultModelText value)? text,
    TResult Function(_ScanResultModelUrl value)? url,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class _ScanResultModelText implements ScanResultModel {
  const factory _ScanResultModelText({required final String text}) =
      _$ScanResultModelTextImpl;

  String get text;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanResultModelTextImplCopyWith<_$ScanResultModelTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScanResultModelUrlImplCopyWith<$Res> {
  factory _$$ScanResultModelUrlImplCopyWith(_$ScanResultModelUrlImpl value,
          $Res Function(_$ScanResultModelUrlImpl) then) =
      __$$ScanResultModelUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, bool isSafe});
}

/// @nodoc
class __$$ScanResultModelUrlImplCopyWithImpl<$Res>
    extends _$ScanResultModelCopyWithImpl<$Res, _$ScanResultModelUrlImpl>
    implements _$$ScanResultModelUrlImplCopyWith<$Res> {
  __$$ScanResultModelUrlImplCopyWithImpl(_$ScanResultModelUrlImpl _value,
      $Res Function(_$ScanResultModelUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? isSafe = null,
  }) {
    return _then(_$ScanResultModelUrlImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isSafe: null == isSafe
          ? _value.isSafe
          : isSafe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScanResultModelUrlImpl implements _ScanResultModelUrl {
  const _$ScanResultModelUrlImpl({required this.url, required this.isSafe});

  @override
  final String url;
  @override
  final bool isSafe;

  @override
  String toString() {
    return 'ScanResultModel.url(url: $url, isSafe: $isSafe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanResultModelUrlImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isSafe, isSafe) || other.isSafe == isSafe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, isSafe);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanResultModelUrlImplCopyWith<_$ScanResultModelUrlImpl> get copyWith =>
      __$$ScanResultModelUrlImplCopyWithImpl<_$ScanResultModelUrlImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) text,
    required TResult Function(String url, bool isSafe) url,
  }) {
    return url(this.url, isSafe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? text,
    TResult? Function(String url, bool isSafe)? url,
  }) {
    return url?.call(this.url, isSafe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? text,
    TResult Function(String url, bool isSafe)? url,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this.url, isSafe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScanResultModelText value) text,
    required TResult Function(_ScanResultModelUrl value) url,
  }) {
    return url(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScanResultModelText value)? text,
    TResult? Function(_ScanResultModelUrl value)? url,
  }) {
    return url?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScanResultModelText value)? text,
    TResult Function(_ScanResultModelUrl value)? url,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this);
    }
    return orElse();
  }
}

abstract class _ScanResultModelUrl implements ScanResultModel {
  const factory _ScanResultModelUrl(
      {required final String url,
      required final bool isSafe}) = _$ScanResultModelUrlImpl;

  String get url;
  bool get isSafe;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanResultModelUrlImplCopyWith<_$ScanResultModelUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
