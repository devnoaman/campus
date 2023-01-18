import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = initial;
  const factory AuthState.loading() = loading;
  const factory AuthState.authenticated() = authenticated;
  const factory AuthState.notAuthenticated(String err) = notAuthenticated;
}
