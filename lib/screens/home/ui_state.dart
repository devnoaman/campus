import 'package:freezed_annotation/freezed_annotation.dart';
part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState {
  const factory UiState.initial() = _Initial;
  const factory UiState.loading() = Loading;
  const factory UiState.loaded(T res) = Loaded<T>;
  const factory UiState.error(String error) = Error;
}
