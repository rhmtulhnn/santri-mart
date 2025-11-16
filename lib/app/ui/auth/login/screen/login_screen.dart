import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:santri_mart/app/core/theme/app_title.dart';
import '../../../../core/theme/app_buttons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../widget/input_field.dart'; // InputField
import '../controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Illustration
              SvgPicture.asset(
                'assets/svg/login.svg',
                width: 188,
                height: 188,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 40),

              // Title
              const AppTitle(
                heading: 'Hai Santri',
                subtitle:
                    'Silahkan masukan alamat email dan'
                    '\nkata sandi yang sudah ada.',
              ),

              // FORM
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email
                    InputField(
                      controller: controller.emailController,
                      label: 'Alamat Email',
                      hint: 'example@kitabstore.com',
                      keyboardType: TextInputType.emailAddress,
                      obscure: false,
                      validator: controller.emailValidator,
                    ),
                    const SizedBox(height: 24),

                    // Password
                    InputField(
                      controller: controller.passwordController,
                      label: 'Kata Sandi',
                      hint: '**********',
                      obscure: true,
                      isObscureControlled: !state.isPasswordVisible,
                      onToggleObscure: controller.togglePasswordVisibility,
                      validator: controller.passwordValidator,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.go('/reset'),
                  child: Text(
                    'Lupa kata sandi?',
                    style: AppFonts.displayBold(
                      size: 15,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Error message (if any)
              if (state.error != null) ...[
                Text(state.error!, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
              ],

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: AppButtons.stylePrimary,
                  onPressed: (!state.isFormValid || state.isLoading)
                      ? null
                      : () {
                          if (!(_formKey.currentState?.validate() ?? false)) {
                            return;
                          }
                          context.go('/main');
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            'Masuk',
                            style: AppFonts.displayBold(
                              size: 16.8,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Register text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tidak punya akun? ',
                    style: AppFonts.displayRegular(
                      size: 15,
                      color: AppColors.tertiary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.go('/register'),
                    child: Text(
                      'Daftar sekarang',
                      style: AppFonts.displayBold(
                        size: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
