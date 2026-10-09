import 'package:flutter/material.dart';
import 'package:sli_common/src/kit/kit_tokens.dart';

/// Kit component `text-field` (variant outlined). States: default, focused, filled, error, pressed, disabled.
class SliKitTextField extends StatelessWidget {
  const SliKitTextField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.errorText,
    this.enabled = true,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  });

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final t = KitTokens.of(context);
    OutlineInputBorder border(Color color, double width) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(t.radiusMd),
      borderSide: BorderSide(color: color, width: width),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: t.label.copyWith(color: t.mutedForeground)),
        SizedBox(height: t.spaceSm),
        SizedBox(
          height: t.sizeControl,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: t.foreground,
            style: t.body.copyWith(
              color: enabled ? t.foreground : t.disabledFg,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: t.body.copyWith(color: t.mutedForeground),
              filled: true,
              fillColor: enabled ? t.background : t.disabledBg,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: t.spaceMd,
                vertical: 12,
              ),
              enabledBorder: border(
                errorText != null ? t.error : t.border,
                errorText != null ? t.borderFocusWidth : t.borderWidth,
              ),
              focusedBorder: border(
                errorText != null ? t.error : t.focus,
                t.borderFocusWidth,
              ),
              disabledBorder: border(t.border, t.borderWidth),
            ),
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: t.spaceSm),
          Text(errorText!, style: t.label.copyWith(color: t.error)),
        ],
      ],
    );
  }
}
