class LoginModel {
  final bool isLoading;
  final String? error;
  final bool isPasswordVisible;
  final bool isFormValid;

  const LoginModel({
    this.isLoading = false,
    this.error,
    this.isPasswordVisible = false,
    this.isFormValid = false,
  });

  LoginModel copyWith({
    bool? isLoading,
    String? error,
    bool? isPasswordVisible,
    bool? isFormValid,
  }) {
    return LoginModel(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  String toString() =>
      'LoginState(isLoading: $isLoading,'
          'error: $error,'
          'isPasswordVisible: $isPasswordVisible,'
          'isFormValid: $isFormValid)';
}
