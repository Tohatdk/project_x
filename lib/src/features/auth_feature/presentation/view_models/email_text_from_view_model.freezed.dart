// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_text_from_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailFormViewModel {
  String get value => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailFormViewModelCopyWith<EmailFormViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailFormViewModelCopyWith<$Res> {
  factory $EmailFormViewModelCopyWith(
          EmailFormViewModel value, $Res Function(EmailFormViewModel) then) =
      _$EmailFormViewModelCopyWithImpl<$Res, EmailFormViewModel>;
  @useResult
  $Res call({String value, bool isValid, String? errorMessage});
}

/// @nodoc
class _$EmailFormViewModelCopyWithImpl<$Res, $Val extends EmailFormViewModel>
    implements $EmailFormViewModelCopyWith<$Res> {
  _$EmailFormViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailFormViewModelImplCopyWith<$Res>
    implements $EmailFormViewModelCopyWith<$Res> {
  factory _$$EmailFormViewModelImplCopyWith(_$EmailFormViewModelImpl value,
          $Res Function(_$EmailFormViewModelImpl) then) =
      __$$EmailFormViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool isValid, String? errorMessage});
}

/// @nodoc
class __$$EmailFormViewModelImplCopyWithImpl<$Res>
    extends _$EmailFormViewModelCopyWithImpl<$Res, _$EmailFormViewModelImpl>
    implements _$$EmailFormViewModelImplCopyWith<$Res> {
  __$$EmailFormViewModelImplCopyWithImpl(_$EmailFormViewModelImpl _value,
      $Res Function(_$EmailFormViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EmailFormViewModelImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmailFormViewModelImpl implements _EmailFormViewModel {
  const _$EmailFormViewModelImpl(
      {this.value = '', this.isValid = true, this.errorMessage});

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EmailFormViewModel(value: $value, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailFormViewModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isValid, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailFormViewModelImplCopyWith<_$EmailFormViewModelImpl> get copyWith =>
      __$$EmailFormViewModelImplCopyWithImpl<_$EmailFormViewModelImpl>(
          this, _$identity);
}

abstract class _EmailFormViewModel implements EmailFormViewModel {
  const factory _EmailFormViewModel(
      {final String value,
      final bool isValid,
      final String? errorMessage}) = _$EmailFormViewModelImpl;

  @override
  String get value;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EmailFormViewModelImplCopyWith<_$EmailFormViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
