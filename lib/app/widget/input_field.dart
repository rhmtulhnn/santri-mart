import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';

class InputField extends StatefulWidget {
  // PARAMS
  final TextEditingController controller;
  final bool enableConfirm;
  final TextEditingController? confirmController;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final String confirmLabel;
  final String confirmHint;
  final bool obscure;
  final bool? isObscureControlled;
  final VoidCallback? onToggleObscure;
  final String? Function(String?)? validator;
  final String? Function(String?)? confirmValidator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onConfirmChanged;
  final TextInputAction textInputAction;
  final TextInputAction confirmTextInputAction;
  final int? maxLength;
  final bool enabled;
  final double borderRadius;
  final Color? fillColor;

  // Layout config
  final double contentHorizontal;
  final double contentPaddingHorizontal;
  final double iconOffsetX;
  final double iconSize;
  final double iconTouchArea;

  const InputField({
    super.key,
    required this.controller,
    this.enableConfirm = false,
    this.confirmController,
    this.label = 'Label',
    this.hint = '',
    this.keyboardType = TextInputType.text,
    this.confirmLabel = 'Konfirmasi',
    this.confirmHint = '',
    this.obscure = false,
    this.isObscureControlled,
    this.onToggleObscure,
    this.validator,
    this.confirmValidator,
    this.onChanged,
    this.onConfirmChanged,
    this.textInputAction = TextInputAction.next,
    this.confirmTextInputAction = TextInputAction.done,
    this.maxLength,
    this.enabled = true,
    this.borderRadius = 14.0,
    this.fillColor,
    this.contentHorizontal = 14.0,
    this.contentPaddingHorizontal = 14.0,
    this.iconOffsetX = -10,
    this.iconSize = 24,
    this.iconTouchArea = 48,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _localObscurePrimary;
  late bool _localObscureConfirm;

  TextEditingController? _confirmControllerInternal;
  TextEditingController get _confirmController =>
      widget.confirmController ?? _confirmControllerInternal!;

  @override
  void initState() {
    super.initState();
    _localObscurePrimary = widget.obscure;
    _localObscureConfirm = widget.obscure;

    if (widget.enableConfirm && widget.confirmController == null) {
      _confirmControllerInternal = TextEditingController();
    }
  }

  @override
  void dispose() {
    _confirmControllerInternal?.dispose();
    super.dispose();
  }

  bool get _effectiveObscurePrimary =>
      widget.isObscureControlled ?? _localObscurePrimary;

  bool get _effectiveObscureConfirm =>
      widget.isObscureControlled ?? _localObscureConfirm;

  String? _defaultValidator(String? v) {
    if (!widget.enabled) return null;
    if (v == null || v.isEmpty) return '${widget.label} wajib diisi';
    if (widget.keyboardType == TextInputType.emailAddress && !v.contains('@')) {
      return 'Alamat email tidak valid';
    }
    if (widget.obscure && v.length < 6) {
      return '${widget.label} minimal 6 karakter';
    }
    return null;
  }

  String? _defaultConfirmValidator(String? v) {
    if (!widget.enabled) return null;
    if (v == null || v.isEmpty) return '${widget.confirmLabel} wajib diisi';
    if (v != widget.controller.text) return 'Nilai tidak cocok';
    return null;
  }

  void _togglePrimary() {
    if (widget.isObscureControlled != null) {
      widget.onToggleObscure?.call();
    } else {
      setState(() => _localObscurePrimary = !_localObscurePrimary);
    }
  }

  void _toggleConfirm() {
    if (widget.isObscureControlled != null) {
      widget.onToggleObscure?.call();
    } else {
      setState(() => _localObscureConfirm = !_localObscureConfirm);
    }
  }

  Widget _buildMovableSuffix({
    required bool effectiveObscure,
    required VoidCallback onToggle,
    required double offsetX,
    required double iconSize,
    required double touchArea,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: SizedBox(
        width: touchArea,
        height: touchArea,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onToggle,
          icon: Icon(
            effectiveObscure ? Icons.visibility_off : Icons.visibility,
            size: iconSize,
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required bool obscure,
    required Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: widget.fillColor ?? AppColors.background,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: widget.contentPaddingHorizontal,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide.none,
      ),
      counterText: '',
      suffixIcon: obscure ? suffix : null,
      suffixIconConstraints:
      BoxConstraints(minWidth: widget.iconTouchArea, minHeight: widget.iconTouchArea),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double hPad = widget.contentHorizontal;
    final labelStyle = AppFonts.displayBold(size: 16, color: AppColors.primary);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: hPad),
          child: Text(widget.label, style: labelStyle),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _effectiveObscurePrimary,
            enabled: widget.enabled,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            validator: widget.validator ?? _defaultValidator,
            decoration: _inputDecoration(
              hint: widget.hint,
              obscure: widget.obscure,
              suffix: _buildMovableSuffix(
                effectiveObscure: _effectiveObscurePrimary,
                onToggle: _togglePrimary,
                offsetX: widget.iconOffsetX,
                iconSize: widget.iconSize,
                touchArea: widget.iconTouchArea,
              ),
            ),
          ),
        ),

        if (widget.enableConfirm) ...[
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: hPad),
            child: Text(widget.confirmLabel, style: labelStyle),
          ),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: TextFormField(
              controller: _confirmController,
              obscureText: _effectiveObscureConfirm,
              enabled: widget.enabled,
              textInputAction: widget.confirmTextInputAction,
              onChanged: widget.onConfirmChanged,
              validator: widget.confirmValidator ?? _defaultConfirmValidator,
              decoration: _inputDecoration(
                hint: widget.confirmHint,
                obscure: widget.obscure,
                suffix: _buildMovableSuffix(
                  effectiveObscure: _effectiveObscureConfirm,
                  onToggle: _toggleConfirm,
                  offsetX: widget.iconOffsetX,
                  iconSize: widget.iconSize,
                  touchArea: widget.iconTouchArea,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
