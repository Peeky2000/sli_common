import 'package:flutter/material.dart';
import 'package:sli_common/src/kit/kit_tokens.dart';

/// Kit component `otp-field` (variant six-digit). States: default, partial, error. Display of the entered code;
/// input comes from the system keyboard through [onChanged] of a hidden field in the host screen.
class SliKitOtpField extends StatelessWidget {
  const SliKitOtpField({
    super.key,
    required this.value,
    this.hasError = false,
    this.length = 6,
  });

  final String value;
  final bool hasError;
  final int length;

  @override
  Widget build(BuildContext context) {
    final t = KitTokens.of(context);
    return Semantics(
      textField: true,
      label: 'Mã OTP $length số',
      value: value,
      excludeSemantics: true,
      // Spec cell size is the maximum; cells shrink to fit narrow widths instead of overflowing.
      child: LayoutBuilder(
        builder: (context, box) {
          final cell = ((box.maxWidth - t.spaceSm * (length - 1)) / length)
              .clamp(0.0, t.sizeOtpCell);
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < length; i++) ...[
                if (i > 0) SizedBox(width: t.spaceSm),
                Container(
                  width: cell,
                  height: t.sizeOtpCell,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: t.background,
                    borderRadius: BorderRadius.circular(t.radiusMd),
                    border: Border.all(
                      color: hasError
                          ? t.error
                          : (i < value.length ? t.borderStrong : t.border),
                      width: hasError ? t.borderFocusWidth : t.borderWidth,
                    ),
                  ),
                  child: Text(
                    i < value.length ? value[i] : '',
                    style: t.body.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: t.foreground,
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
