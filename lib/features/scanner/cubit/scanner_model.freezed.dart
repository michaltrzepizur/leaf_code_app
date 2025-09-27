// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_model.dart';

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
    required TResult Function(String url, bool isSafe) url,
    required TResult Function(
            String barcode, String productName, String productDetails)
        product,
    required TResult Function(String text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, bool isSafe)? url,
    TResult? Function(
            String barcode, String productName, String productDetails)?
        product,
    TResult? Function(String text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, bool isSafe)? url,
    TResult Function(String barcode, String productName, String productDetails)?
        product,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UrlResult value) url,
    required TResult Function(ProductResult value) product,
    required TResult Function(TextResult value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UrlResult value)? url,
    TResult? Function(ProductResult value)? product,
    TResult? Function(TextResult value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UrlResult value)? url,
    TResult Function(ProductResult value)? product,
    TResult Function(TextResult value)? text,
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
abstract class _$$UrlResultImplCopyWith<$Res> {
  factory _$$UrlResultImplCopyWith(
          _$UrlResultImpl value, $Res Function(_$UrlResultImpl) then) =
      __$$UrlResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, bool isSafe});
}

/// @nodoc
class __$$UrlResultImplCopyWithImpl<$Res>
    extends _$ScanResultModelCopyWithImpl<$Res, _$UrlResultImpl>
    implements _$$UrlResultImplCopyWith<$Res> {
  __$$UrlResultImplCopyWithImpl(
      _$UrlResultImpl _value, $Res Function(_$UrlResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? isSafe = null,
  }) {
    return _then(_$UrlResultImpl(
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

class _$UrlResultImpl implements UrlResult {
  const _$UrlResultImpl({required this.url, required this.isSafe});

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
            other is _$UrlResultImpl &&
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
  _$$UrlResultImplCopyWith<_$UrlResultImpl> get copyWith =>
      __$$UrlResultImplCopyWithImpl<_$UrlResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, bool isSafe) url,
    required TResult Function(
            String barcode, String productName, String productDetails)
        product,
    required TResult Function(String text) text,
  }) {
    return url(this.url, isSafe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, bool isSafe)? url,
    TResult? Function(
            String barcode, String productName, String productDetails)?
        product,
    TResult? Function(String text)? text,
  }) {
    return url?.call(this.url, isSafe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, bool isSafe)? url,
    TResult Function(String barcode, String productName, String productDetails)?
        product,
    TResult Function(String text)? text,
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
    required TResult Function(UrlResult value) url,
    required TResult Function(ProductResult value) product,
    required TResult Function(TextResult value) text,
  }) {
    return url(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UrlResult value)? url,
    TResult? Function(ProductResult value)? product,
    TResult? Function(TextResult value)? text,
  }) {
    return url?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UrlResult value)? url,
    TResult Function(ProductResult value)? product,
    TResult Function(TextResult value)? text,
    required TResult orElse(),
  }) {
    if (url != null) {
      return url(this);
    }
    return orElse();
  }
}

abstract class UrlResult implements ScanResultModel {
  const factory UrlResult(
      {required final String url,
      required final bool isSafe}) = _$UrlResultImpl;

  String get url;
  bool get isSafe;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UrlResultImplCopyWith<_$UrlResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductResultImplCopyWith<$Res> {
  factory _$$ProductResultImplCopyWith(
          _$ProductResultImpl value, $Res Function(_$ProductResultImpl) then) =
      __$$ProductResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String barcode, String productName, String productDetails});
}

/// @nodoc
class __$$ProductResultImplCopyWithImpl<$Res>
    extends _$ScanResultModelCopyWithImpl<$Res, _$ProductResultImpl>
    implements _$$ProductResultImplCopyWith<$Res> {
  __$$ProductResultImplCopyWithImpl(
      _$ProductResultImpl _value, $Res Function(_$ProductResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? productName = null,
    Object? productDetails = null,
  }) {
    return _then(_$ProductResultImpl(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productDetails: null == productDetails
          ? _value.productDetails
          : productDetails // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductResultImpl implements ProductResult {
  const _$ProductResultImpl(
      {required this.barcode,
      required this.productName,
      required this.productDetails});

  @override
  final String barcode;
  @override
  final String productName;
  @override
  final String productDetails;

  @override
  String toString() {
    return 'ScanResultModel.product(barcode: $barcode, productName: $productName, productDetails: $productDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductResultImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productDetails, productDetails) ||
                other.productDetails == productDetails));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, barcode, productName, productDetails);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductResultImplCopyWith<_$ProductResultImpl> get copyWith =>
      __$$ProductResultImplCopyWithImpl<_$ProductResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, bool isSafe) url,
    required TResult Function(
            String barcode, String productName, String productDetails)
        product,
    required TResult Function(String text) text,
  }) {
    return product(barcode, productName, productDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, bool isSafe)? url,
    TResult? Function(
            String barcode, String productName, String productDetails)?
        product,
    TResult? Function(String text)? text,
  }) {
    return product?.call(barcode, productName, productDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, bool isSafe)? url,
    TResult Function(String barcode, String productName, String productDetails)?
        product,
    TResult Function(String text)? text,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(barcode, productName, productDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UrlResult value) url,
    required TResult Function(ProductResult value) product,
    required TResult Function(TextResult value) text,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UrlResult value)? url,
    TResult? Function(ProductResult value)? product,
    TResult? Function(TextResult value)? text,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UrlResult value)? url,
    TResult Function(ProductResult value)? product,
    TResult Function(TextResult value)? text,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class ProductResult implements ScanResultModel {
  const factory ProductResult(
      {required final String barcode,
      required final String productName,
      required final String productDetails}) = _$ProductResultImpl;

  String get barcode;
  String get productName;
  String get productDetails;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductResultImplCopyWith<_$ProductResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextResultImplCopyWith<$Res> {
  factory _$$TextResultImplCopyWith(
          _$TextResultImpl value, $Res Function(_$TextResultImpl) then) =
      __$$TextResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TextResultImplCopyWithImpl<$Res>
    extends _$ScanResultModelCopyWithImpl<$Res, _$TextResultImpl>
    implements _$$TextResultImplCopyWith<$Res> {
  __$$TextResultImplCopyWithImpl(
      _$TextResultImpl _value, $Res Function(_$TextResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TextResultImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TextResultImpl implements TextResult {
  const _$TextResultImpl({required this.text});

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
            other is _$TextResultImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextResultImplCopyWith<_$TextResultImpl> get copyWith =>
      __$$TextResultImplCopyWithImpl<_$TextResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String url, bool isSafe) url,
    required TResult Function(
            String barcode, String productName, String productDetails)
        product,
    required TResult Function(String text) text,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String url, bool isSafe)? url,
    TResult? Function(
            String barcode, String productName, String productDetails)?
        product,
    TResult? Function(String text)? text,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String url, bool isSafe)? url,
    TResult Function(String barcode, String productName, String productDetails)?
        product,
    TResult Function(String text)? text,
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
    required TResult Function(UrlResult value) url,
    required TResult Function(ProductResult value) product,
    required TResult Function(TextResult value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UrlResult value)? url,
    TResult? Function(ProductResult value)? product,
    TResult? Function(TextResult value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UrlResult value)? url,
    TResult Function(ProductResult value)? product,
    TResult Function(TextResult value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class TextResult implements ScanResultModel {
  const factory TextResult({required final String text}) = _$TextResultImpl;

  String get text;

  /// Create a copy of ScanResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextResultImplCopyWith<_$TextResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
