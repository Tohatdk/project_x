// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmailEditViewModel {
  String get email => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailEditViewModelCopyWith<EmailEditViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailEditViewModelCopyWith<$Res> {
  factory $EmailEditViewModelCopyWith(
          EmailEditViewModel value, $Res Function(EmailEditViewModel) then) =
      _$EmailEditViewModelCopyWithImpl<$Res, EmailEditViewModel>;
  @useResult
  $Res call({String email, String? errorMessage, bool isValid});
}

/// @nodoc
class _$EmailEditViewModelCopyWithImpl<$Res, $Val extends EmailEditViewModel>
    implements $EmailEditViewModelCopyWith<$Res> {
  _$EmailEditViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? errorMessage = freezed,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailEditViewModelImplCopyWith<$Res>
    implements $EmailEditViewModelCopyWith<$Res> {
  factory _$$EmailEditViewModelImplCopyWith(_$EmailEditViewModelImpl value,
          $Res Function(_$EmailEditViewModelImpl) then) =
      __$$EmailEditViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String? errorMessage, bool isValid});
}

/// @nodoc
class __$$EmailEditViewModelImplCopyWithImpl<$Res>
    extends _$EmailEditViewModelCopyWithImpl<$Res, _$EmailEditViewModelImpl>
    implements _$$EmailEditViewModelImplCopyWith<$Res> {
  __$$EmailEditViewModelImplCopyWithImpl(_$EmailEditViewModelImpl _value,
      $Res Function(_$EmailEditViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? errorMessage = freezed,
    Object? isValid = null,
  }) {
    return _then(_$EmailEditViewModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EmailEditViewModelImpl implements _EmailEditViewModel {
  const _$EmailEditViewModelImpl(
      {required this.email, this.errorMessage, this.isValid = false});

  @override
  final String email;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'EmailEditViewModel(email: $email, errorMessage: $errorMessage, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailEditViewModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, errorMessage, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailEditViewModelImplCopyWith<_$EmailEditViewModelImpl> get copyWith =>
      __$$EmailEditViewModelImplCopyWithImpl<_$EmailEditViewModelImpl>(
          this, _$identity);
}

abstract class _EmailEditViewModel implements EmailEditViewModel {
  const factory _EmailEditViewModel(
      {required final String email,
      final String? errorMessage,
      final bool isValid}) = _$EmailEditViewModelImpl;

  @override
  String get email;
  @override
  String? get errorMessage;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$EmailEditViewModelImplCopyWith<_$EmailEditViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
