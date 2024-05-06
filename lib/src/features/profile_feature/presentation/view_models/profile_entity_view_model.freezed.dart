// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEntityViewModel {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get photoURL => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEntityViewModelCopyWith<ProfileEntityViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityViewModelCopyWith<$Res> {
  factory $ProfileEntityViewModelCopyWith(ProfileEntityViewModel value,
          $Res Function(ProfileEntityViewModel) then) =
      _$ProfileEntityViewModelCopyWithImpl<$Res, ProfileEntityViewModel>;
  @useResult
  $Res call(
      {String username, String email, String phoneNumber, String photoURL});
}

/// @nodoc
class _$ProfileEntityViewModelCopyWithImpl<$Res,
        $Val extends ProfileEntityViewModel>
    implements $ProfileEntityViewModelCopyWith<$Res> {
  _$ProfileEntityViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? photoURL = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEntityViewModelImplCopyWith<$Res>
    implements $ProfileEntityViewModelCopyWith<$Res> {
  factory _$$ProfileEntityViewModelImplCopyWith(
          _$ProfileEntityViewModelImpl value,
          $Res Function(_$ProfileEntityViewModelImpl) then) =
      __$$ProfileEntityViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username, String email, String phoneNumber, String photoURL});
}

/// @nodoc
class __$$ProfileEntityViewModelImplCopyWithImpl<$Res>
    extends _$ProfileEntityViewModelCopyWithImpl<$Res,
        _$ProfileEntityViewModelImpl>
    implements _$$ProfileEntityViewModelImplCopyWith<$Res> {
  __$$ProfileEntityViewModelImplCopyWithImpl(
      _$ProfileEntityViewModelImpl _value,
      $Res Function(_$ProfileEntityViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? photoURL = null,
  }) {
    return _then(_$ProfileEntityViewModelImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileEntityViewModelImpl implements _ProfileEntityViewModel {
  const _$ProfileEntityViewModelImpl(
      {required this.username,
      required this.email,
      required this.phoneNumber,
      required this.photoURL});

  @override
  final String username;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String photoURL;

  @override
  String toString() {
    return 'ProfileEntityViewModel(username: $username, email: $email, phoneNumber: $phoneNumber, photoURL: $photoURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityViewModelImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, email, phoneNumber, photoURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityViewModelImplCopyWith<_$ProfileEntityViewModelImpl>
      get copyWith => __$$ProfileEntityViewModelImplCopyWithImpl<
          _$ProfileEntityViewModelImpl>(this, _$identity);
}

abstract class _ProfileEntityViewModel implements ProfileEntityViewModel {
  const factory _ProfileEntityViewModel(
      {required final String username,
      required final String email,
      required final String phoneNumber,
      required final String photoURL}) = _$ProfileEntityViewModelImpl;

  @override
  String get username;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get photoURL;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEntityViewModelImplCopyWith<_$ProfileEntityViewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
