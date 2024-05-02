import 'package:freezed_annotation/freezed_annotation.dart';
part 'email_text_from_view_model.freezed.dart';

@freezed
class EmailFormViewModel with _$EmailFormViewModel{
  const factory EmailFormViewModel({
    @Default('') String value,
  @Default(false) bool isValid,
  String? errorMessage,
})=_EmailFormViewModel;

}