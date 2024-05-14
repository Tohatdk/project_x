import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_edit_view_model.freezed.dart';

@freezed
class EmailEditViewModel with _$EmailEditViewModel {
  const factory EmailEditViewModel({
    required String value,
    String? errorMessage,
    @Default(false) bool isValid,
  }) = _EmailEditViewModel;
}
