// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginPageState {
  EmailFormViewModel get emailViewModel => throw _privateConstructorUsedError;
  PasswordFormViewModel get passwordViewModel =>
      throw _privateConstructorUsedError;
  LoginPageStatus get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call(
      {EmailFormViewModel emailViewModel,
      PasswordFormViewModel passwordViewModel,
      LoginPageStatus status,
      String errorMessage});

  $EmailFormViewModelCopyWith<$Res> get emailViewModel;
  $PasswordFormViewModelCopyWith<$Res> get passwordViewModel;
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailViewModel = null,
    Object? passwordViewModel = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      emailViewModel: null == emailViewModel
          ? _value.emailViewModel
          : emailViewModel // ignore: cast_nullable_to_non_nullable
              as EmailFormViewModel,
      passwordViewModel: null == passwordViewModel
          ? _value.passwordViewModel
          : passwordViewModel // ignore: cast_nullable_to_non_nullable
              as PasswordFormViewModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginPageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmailFormViewModelCopyWith<$Res> get emailViewModel {
    return $EmailFormViewModelCopyWith<$Res>(_value.emailViewModel, (value) {
      return _then(_value.copyWith(emailViewModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PasswordFormViewModelCopyWith<$Res> get passwordViewModel {
    return $PasswordFormViewModelCopyWith<$Res>(_value.passwordViewModel,
        (value) {
      return _then(_value.copyWith(passwordViewModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginPageStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageStateImplCopyWith(_$LoginPageStateImpl value,
          $Res Function(_$LoginPageStateImpl) then) =
      __$$LoginPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmailFormViewModel emailViewModel,
      PasswordFormViewModel passwordViewModel,
      LoginPageStatus status,
      String errorMessage});

  @override
  $EmailFormViewModelCopyWith<$Res> get emailViewModel;
  @override
  $PasswordFormViewModelCopyWith<$Res> get passwordViewModel;
}

/// @nodoc
class __$$LoginPageStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageStateImpl>
    implements _$$LoginPageStateImplCopyWith<$Res> {
  __$$LoginPageStateImplCopyWithImpl(
      _$LoginPageStateImpl _value, $Res Function(_$LoginPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailViewModel = null,
    Object? passwordViewModel = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$LoginPageStateImpl(
      emailViewModel: null == emailViewModel
          ? _value.emailViewModel
          : emailViewModel // ignore: cast_nullable_to_non_nullable
              as EmailFormViewModel,
      passwordViewModel: null == passwordViewModel
          ? _value.passwordViewModel
          : passwordViewModel // ignore: cast_nullable_to_non_nullable
              as PasswordFormViewModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginPageStatus,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginPageStateImpl implements _LoginPageState {
  const _$LoginPageStateImpl(
      {this.emailViewModel = const EmailFormViewModel(),
      this.passwordViewModel = const PasswordFormViewModel(),
      this.status = LoginPageStatus.none,
      this.errorMessage = ''});

  @override
  @JsonKey()
  final EmailFormViewModel emailViewModel;
  @override
  @JsonKey()
  final PasswordFormViewModel passwordViewModel;
  @override
  @JsonKey()
  final LoginPageStatus status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'LoginPageState(emailViewModel: $emailViewModel, passwordViewModel: $passwordViewModel, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageStateImpl &&
            (identical(other.emailViewModel, emailViewModel) ||
                other.emailViewModel == emailViewModel) &&
            (identical(other.passwordViewModel, passwordViewModel) ||
                other.passwordViewModel == passwordViewModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, emailViewModel, passwordViewModel, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      __$$LoginPageStateImplCopyWithImpl<_$LoginPageStateImpl>(
          this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  const factory _LoginPageState(
      {final EmailFormViewModel emailViewModel,
      final PasswordFormViewModel passwordViewModel,
      final LoginPageStatus status,
      final String errorMessage}) = _$LoginPageStateImpl;

  @override
  EmailFormViewModel get emailViewModel;
  @override
  PasswordFormViewModel get passwordViewModel;
  @override
  LoginPageStatus get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
