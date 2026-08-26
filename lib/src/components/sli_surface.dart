import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import 'package:sli_common/src/foundation/sli_colors.dart';
import 'package:sli_common/src/foundation/sli_tokens.dart';
import 'package:sli_common/src/shadcn/sli_shadcn_scope.dart';

class SliSurface extends StatelessWidget {
  const SliSurface({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(SliSpacing.lg),
    this.borderRadius = SliRadii.lg,
    this.showBorder = true,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final colors = context.sliColors;
    return SliShadcnScope(
      child: shadcn.OutlinedContainer(
        backgroundColor: colors.surface,
        borderColor: showBorder ? colors.border : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        padding: padding,
        child: child,
      ),
    );
  }
}
