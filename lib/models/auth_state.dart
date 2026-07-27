import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AsyncValue<User?> user,
    @Default(false) bool isLoading,
  }) = _AuthState;
}
