import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import 'package:sli_common/src/shadcn/sli_shadcn_scope.dart';

enum SliButtonVariant { primary, secondary, outline, ghost, destructive }

enum SliButtonSize { small, medium, large }

class SliButton extends StatelessWidget {
  const SliButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = SliButtonVariant.primary,
    this.size = SliButtonSize.medium,
    this.leading,
    this.trailing,
    this.isLoading = false,
    this.expand = false,
    this.semanticLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final SliButtonVariant variant;
  final SliButtonSize size;
  final Widget? leading;
  final Widget? trailing;
  final bool isLoading;
  final bool expand;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;
    final labelWidget = isLoading
        ? const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(label, maxLines: 1, overflow: TextOverflow.ellipsis);

    final button = switch (variant) {
      SliButtonVariant.primary => shadcn.PrimaryButton(
        onPressed: enabled ? onPressed : null,
        size: _shadcnSize,
        leading: isLoading ? null : leading,
        trailing: isLoading ? null : trailing,
        child: labelWidget,
      ),
      SliButtonVariant.secondary => shadcn.SecondaryButton(
        onPressed: enabled ? onPressed : null,
        size: _shadcnSize,
        leading: isLoading ? null : leading,
        trailing: isLoading ? null : trailing,
        child: labelWidget,
      ),
      SliButtonVariant.outline => shadcn.OutlineButton(
        onPressed: enabled ? onPressed : null,
        size: _shadcnSize,
        leading: isLoading ? null : leading,
        trailing: isLoading ? null : trailing,
        child: labelWidget,
      ),
      SliButtonVariant.ghost => shadcn.GhostButton(
        onPressed: enabled ? onPressed : null,
        size: _shadcnSize,
        leading: isLoading ? null : leading,
        trailing: isLoading ? null : trailing,
        child: labelWidget,
      ),
      SliButtonVariant.destructive => shadcn.DestructiveButton(
        onPressed: enabled ? onPressed : null,
        size: _shadcnSize,
        leading: isLoading ? null : leading,
        trailing: isLoading ? null : trailing,
        child: labelWidget,
      ),
    };

    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticLabel ?? label,
      child: ExcludeSemantics(
        child: SliShadcnScope(
          child: expand
              ? SizedBox(width: double.infinity, child: button)
              : button,
        ),
      ),
    );
  }

  shadcn.ButtonSize get _shadcnSize => switch (size) {
    SliButtonSize.small => shadcn.ButtonSize.small,
    SliButtonSize.medium => shadcn.ButtonSize.normal,
    SliButtonSize.large => shadcn.ButtonSize.large,
  };
}
