import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity_view_model.freezed.dart';

@freezed
class ProfileEntityViewModel with _$ProfileEntityViewModel {
  const factory ProfileEntityViewModel({
    String? username,
    required String email,
    String? phoneNumber,
    String? photoURL,
  }) = _ProfileEntityViewModel;
}
