// 📄 auth_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.data(User? user) = AuthData;
  const factory AuthState.error(String message) = AuthError;


}
// 👉 AJOUTE ÇA EN DESSOUS
extension AuthStateX on AuthState {
  bool get isLoading => this is AuthLoading;
  bool get hasError => this is AuthError;
  bool get hasData => this is AuthData;
}