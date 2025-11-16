import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/model/login_model.dart';

class LoginController extends StateNotifier<LoginModel> {
  final Ref ref;

  // controllers exposed so widgets can bind to them
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // internal listeners references so we can remove them on dispose
  late final VoidCallback _emailListener;
  late final VoidCallback _passwordListener;

  LoginController(this.ref) : super(const LoginModel()) {
    // initialize listeners to update form validity in realtime
    _emailListener = () => _validateForm();
    _passwordListener = () => _validateForm();

    emailController.addListener(_emailListener);
    passwordController.addListener(_passwordListener);

    // initial validation
    _validateForm();
  }

  // ----------------- Validators -----------------
  // These can be passed directly to TextFormField.validator
  String? emailValidator(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Email wajib diisi';
    if (!s.contains('@')) return 'Email tidak valid';
    return null;
  }

  String? passwordValidator(String? v) {
    final s = v ?? '';
    if (s.isEmpty) return 'Kata sandi wajib diisi';
    if (s.length < 6) return 'Kata sandi minimal 6 karakter';
    return null;
  }

  String? confirmPasswordValidator(String? v, {required TextEditingController primaryController, String? label = 'Konfirmasi'}) {
    final s = v ?? '';
    if (s.isEmpty) return '$label wajib diisi';
    if (s != primaryController.text) return 'Nilai tidak cocok';
    return null;
  }

  // ----------------- Form validity (realtime) -----------------
  void _validateForm() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    final emailOk = email.isNotEmpty && email.contains('@');
    final passwordOk = password.isNotEmpty && password.length >= 6;

    final formValid = emailOk && passwordOk;

    if (formValid != state.isFormValid) {
      state = state.copyWith(isFormValid: formValid, error: null);
    }
  }

  // ----------------- Visibility toggle -----------------
  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  // ----------------- Submit / Login -----------------
  /// Validates using the validators and then attempts login.
  /// Returns true on success.
  Future<bool> login() async {
    // server-side / final validation before attempting
    final emailErr = emailValidator(emailController.text);
    final pwErr = passwordValidator(passwordController.text);

    if (emailErr != null || pwErr != null) {
      state = state.copyWith(error: emailErr ?? pwErr);
      _validateForm(); // ensure isFormValid reflects latest
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      // TODO: replace with real API call
      await Future.delayed(const Duration(seconds: 2));

      state = state.copyWith(isLoading: false, error: null);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    emailController.removeListener(_emailListener);
    passwordController.removeListener(_passwordListener);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

/// Provider
final loginControllerProvider =
StateNotifierProvider.autoDispose<LoginController, LoginModel>((ref) {
  return LoginController(ref);
});
