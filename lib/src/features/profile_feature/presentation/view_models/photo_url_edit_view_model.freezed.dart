// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_url_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoUrlEditViewModel {
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoUrlEditViewModelCopyWith<PhotoUrlEditViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUrlEditViewModelCopyWith<$Res> {
  factory $PhotoUrlEditViewModelCopyWith(PhotoUrlEditViewModel value,
          $Res Function(PhotoUrlEditViewModel) then) =
      _$PhotoUrlEditViewModelCopyWithImpl<$Res, PhotoUrlEditViewModel>;
  @useResult
  $Res call({String? photoUrl, String? errorMessage});
}

/// @nodoc
class _$PhotoUrlEditViewModelCopyWithImpl<$Res,
        $Val extends PhotoUrlEditViewModel>
    implements $PhotoUrlEditViewModelCopyWith<$Res> {
  _$PhotoUrlEditViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoUrl = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUrlEditViewModelImplCopyWith<$Res>
    implements $PhotoUrlEditViewModelCopyWith<$Res> {
  factory _$$PhotoUrlEditViewModelImplCopyWith(
          _$PhotoUrlEditViewModelImpl value,
          $Res Function(_$PhotoUrlEditViewModelImpl) then) =
      __$$PhotoUrlEditViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? photoUrl, String? errorMessage});
}

/// @nodoc
class __$$PhotoUrlEditViewModelImplCopyWithImpl<$Res>
    extends _$PhotoUrlEditViewModelCopyWithImpl<$Res,
        _$PhotoUrlEditViewModelImpl>
    implements _$$PhotoUrlEditViewModelImplCopyWith<$Res> {
  __$$PhotoUrlEditViewModelImplCopyWithImpl(_$PhotoUrlEditViewModelImpl _value,
      $Res Function(_$PhotoUrlEditViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoUrl = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$PhotoUrlEditViewModelImpl(
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PhotoUrlEditViewModelImpl implements _PhotoUrlEditViewModel {
  const _$PhotoUrlEditViewModelImpl({this.photoUrl, this.errorMessage});

  @override
  final String? photoUrl;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PhotoUrlEditViewModel(photoUrl: $photoUrl, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUrlEditViewModelImpl &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoUrl, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUrlEditViewModelImplCopyWith<_$PhotoUrlEditViewModelImpl>
      get copyWith => __$$PhotoUrlEditViewModelImplCopyWithImpl<
          _$PhotoUrlEditViewModelImpl>(this, _$identity);
}

abstract class _PhotoUrlEditViewModel implements PhotoUrlEditViewModel {
  const factory _PhotoUrlEditViewModel(
      {final String? photoUrl,
      final String? errorMessage}) = _$PhotoUrlEditViewModelImpl;

  @override
  String? get photoUrl;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$PhotoUrlEditViewModelImplCopyWith<_$PhotoUrlEditViewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
