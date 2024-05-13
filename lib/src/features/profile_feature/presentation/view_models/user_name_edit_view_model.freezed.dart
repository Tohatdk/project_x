// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_name_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserNameEditViewModel {
  String? get value => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserNameEditViewModelCopyWith<UserNameEditViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNameEditViewModelCopyWith<$Res> {
  factory $UserNameEditViewModelCopyWith(UserNameEditViewModel value,
          $Res Function(UserNameEditViewModel) then) =
      _$UserNameEditViewModelCopyWithImpl<$Res, UserNameEditViewModel>;
  @useResult
  $Res call({String? value, String? errorMessage});
}

/// @nodoc
class _$UserNameEditViewModelCopyWithImpl<$Res,
        $Val extends UserNameEditViewModel>
    implements $UserNameEditViewModelCopyWith<$Res> {
  _$UserNameEditViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserNameEditViewModelImplCopyWith<$Res>
    implements $UserNameEditViewModelCopyWith<$Res> {
  factory _$$UserNameEditViewModelImplCopyWith(
          _$UserNameEditViewModelImpl value,
          $Res Function(_$UserNameEditViewModelImpl) then) =
      __$$UserNameEditViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value, String? errorMessage});
}

/// @nodoc
class __$$UserNameEditViewModelImplCopyWithImpl<$Res>
    extends _$UserNameEditViewModelCopyWithImpl<$Res,
        _$UserNameEditViewModelImpl>
    implements _$$UserNameEditViewModelImplCopyWith<$Res> {
  __$$UserNameEditViewModelImplCopyWithImpl(_$UserNameEditViewModelImpl _value,
      $Res Function(_$UserNameEditViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UserNameEditViewModelImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserNameEditViewModelImpl implements _UserNameEditViewModel {
  const _$UserNameEditViewModelImpl({this.value, this.errorMessage});

  @override
  final String? value;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserNameEditViewModel(value: $value, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNameEditViewModelImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNameEditViewModelImplCopyWith<_$UserNameEditViewModelImpl>
      get copyWith => __$$UserNameEditViewModelImplCopyWithImpl<
          _$UserNameEditViewModelImpl>(this, _$identity);
}

abstract class _UserNameEditViewModel implements UserNameEditViewModel {
  const factory _UserNameEditViewModel(
      {final String? value,
      final String? errorMessage}) = _$UserNameEditViewModelImpl;

  @override
  String? get value;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserNameEditViewModelImplCopyWith<_$UserNameEditViewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
