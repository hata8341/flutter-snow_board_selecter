import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_contact_state.freezed.dart';

@freezed
class FormContactState with _$FormContactState {
  const factory FormContactState({
    @Default(1) int positon,
    @Default(false) bool conennctionStatus,
  }) = _FormContactState;
}
