import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_url_edit_view_model.freezed.dart';

@freezed
class PhotoUrlEditViewModel with _$PhotoUrlEditViewModel {
  const factory PhotoUrlEditViewModel({
    String? photoUrl,
    String? errorMessage,
  }) = _PhotoUrlEditViewModel;
}
