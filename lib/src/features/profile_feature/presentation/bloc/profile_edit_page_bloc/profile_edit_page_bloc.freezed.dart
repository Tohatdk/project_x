// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEditPageState {
  ProfileEntityViewModel get profileEntityViewModel =>
      throw _privateConstructorUsedError;
  ProfileEditStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditPageStateCopyWith<ProfileEditPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditPageStateCopyWith<$Res> {
  factory $ProfileEditPageStateCopyWith(ProfileEditPageState value,
          $Res Function(ProfileEditPageState) then) =
      _$ProfileEditPageStateCopyWithImpl<$Res, ProfileEditPageState>;
  @useResult
  $Res call(
      {ProfileEntityViewModel profileEntityViewModel,
      ProfileEditStatus status,
      String message});

  $ProfileEntityViewModelCopyWith<$Res> get profileEntityViewModel;
}

/// @nodoc
class _$ProfileEditPageStateCopyWithImpl<$Res,
        $Val extends ProfileEditPageState>
    implements $ProfileEditPageStateCopyWith<$Res> {
  _$ProfileEditPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileEntityViewModel = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      profileEntityViewModel: null == profileEntityViewModel
          ? _value.profileEntityViewModel
          : profileEntityViewModel // ignore: cast_nullable_to_non_nullable
              as ProfileEntityViewModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileEntityViewModelCopyWith<$Res> get profileEntityViewModel {
    return $ProfileEntityViewModelCopyWith<$Res>(_value.profileEntityViewModel,
        (value) {
      return _then(_value.copyWith(profileEntityViewModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileEditPageStateImplCopyWith<$Res>
    implements $ProfileEditPageStateCopyWith<$Res> {
  factory _$$ProfileEditPageStateImplCopyWith(_$ProfileEditPageStateImpl value,
          $Res Function(_$ProfileEditPageStateImpl) then) =
      __$$ProfileEditPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfileEntityViewModel profileEntityViewModel,
      ProfileEditStatus status,
      String message});

  @override
  $ProfileEntityViewModelCopyWith<$Res> get profileEntityViewModel;
}

/// @nodoc
class __$$ProfileEditPageStateImplCopyWithImpl<$Res>
    extends _$ProfileEditPageStateCopyWithImpl<$Res, _$ProfileEditPageStateImpl>
    implements _$$ProfileEditPageStateImplCopyWith<$Res> {
  __$$ProfileEditPageStateImplCopyWithImpl(_$ProfileEditPageStateImpl _value,
      $Res Function(_$ProfileEditPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileEntityViewModel = null,
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$ProfileEditPageStateImpl(
      profileEntityViewModel: null == profileEntityViewModel
          ? _value.profileEntityViewModel
          : profileEntityViewModel // ignore: cast_nullable_to_non_nullable
              as ProfileEntityViewModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileEditPageStateImpl implements _ProfileEditPageState {
  const _$ProfileEditPageStateImpl(
      {this.profileEntityViewModel = const ProfileEntityViewModel(email: ''),
      this.status = ProfileEditStatus.none,
      this.message = ''});

  @override
  @JsonKey()
  final ProfileEntityViewModel profileEntityViewModel;
  @override
  @JsonKey()
  final ProfileEditStatus status;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ProfileEditPageState(profileEntityViewModel: $profileEntityViewModel, status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEditPageStateImpl &&
            (identical(other.profileEntityViewModel, profileEntityViewModel) ||
                other.profileEntityViewModel == profileEntityViewModel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileEntityViewModel, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEditPageStateImplCopyWith<_$ProfileEditPageStateImpl>
      get copyWith =>
          __$$ProfileEditPageStateImplCopyWithImpl<_$ProfileEditPageStateImpl>(
              this, _$identity);
}

abstract class _ProfileEditPageState implements ProfileEditPageState {
  const factory _ProfileEditPageState(
      {final ProfileEntityViewModel profileEntityViewModel,
      final ProfileEditStatus status,
      final String message}) = _$ProfileEditPageStateImpl;

  @override
  ProfileEntityViewModel get profileEntityViewModel;
  @override
  ProfileEditStatus get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEditPageStateImplCopyWith<_$ProfileEditPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
