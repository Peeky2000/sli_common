import 'package:material_ui/material_ui.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

/// Installs the Shadcn theme without leaking it to consumers.
class SliShadcnScope extends StatelessWidget {
  const SliShadcnScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shadcnTheme = Theme.of(context).brightness == Brightness.dark
        ? const shadcn.ThemeData.dark()
        : const shadcn.ThemeData();

    // shadcn_flutter 0.0.55 removed the overlay manager layer: popovers,
    // menus and tooltips configure themselves, so only the theme is needed.
    return shadcn.Theme(data: shadcnTheme, child: child);
  }
}
