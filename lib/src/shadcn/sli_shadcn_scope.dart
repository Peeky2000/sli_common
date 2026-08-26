import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

/// Installs the Shadcn theme/overlay internals without leaking them to consumers.
class SliShadcnScope extends StatelessWidget {
  const SliShadcnScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shadcnTheme = Theme.of(context).brightness == Brightness.dark
        ? const shadcn.ThemeData.dark()
        : const shadcn.ThemeData();

    return shadcn.Theme(
      data: shadcnTheme,
      child: shadcn.OverlayManagerLayer(
        menuHandler: const shadcn.PopoverOverlayHandler(),
        popoverHandler: const shadcn.PopoverOverlayHandler(),
        tooltipHandler: const shadcn.PopoverOverlayHandler(),
        child: child,
      ),
    );
  }
}
