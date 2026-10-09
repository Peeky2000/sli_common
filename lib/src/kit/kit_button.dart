import 'package:flutter/material.dart';
import 'package:sli_common/src/kit/kit_tokens.dart';

/// Kit component `button` (variant primary). States: default, pressed, disabled, loading.
class SliKitButton extends StatelessWidget {
  const SliKitButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.forcePressed = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  /// Test/catalog hook to render the pressed state deterministically.
  final bool forcePressed;

  @override
  Widget build(BuildContext context) {
    final t = KitTokens.of(context);
    final enabled = onPressed != null && !isLoading;
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: SizedBox(
        height: t.sizeControl,
        width: double.infinity,
        child: Material(
          color: !enabled && !isLoading
              ? t.disabledBg
              : (forcePressed ? t.primaryPressed : t.primary),
          borderRadius: BorderRadius.circular(t.radiusMd),
          child: InkWell(
            onTap: enabled ? onPressed : null,
            borderRadius: BorderRadius.circular(t.radiusMd),
            overlayColor: WidgetStatePropertyAll(t.primaryPressed),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: t.spaceLg),
              child: Center(
                child: isLoading
                    ? SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: t.onPrimary,
                          value: 0.75,
                        ),
                      )
                    : Text(
                        label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.body.copyWith(
                          fontWeight: FontWeight.w500,
                          color: enabled ? t.onPrimary : t.disabledFg,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
