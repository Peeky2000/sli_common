import 'package:flutter/material.dart';
import 'package:sli_common/src/foundation/sli_colors.dart';
import 'package:sli_common/src/foundation/sli_tokens.dart';

typedef SliBottomSheetBuilder = Widget Function(BuildContext context);

Future<T?> showSliBottomSheet<T>({
  required BuildContext context,
  required SliBottomSheetBuilder builder,
  bool isDismissible = true,
  bool enableDrag = true,
  bool isScrollControlled = true,
  bool useRootNavigator = false,
  Color? barrierColor,
  RouteSettings? routeSettings,
}) => showModalBottomSheet<T>(
  context: context,
  isDismissible: isDismissible,
  enableDrag: enableDrag,
  isScrollControlled: isScrollControlled,
  useRootNavigator: useRootNavigator,
  barrierColor: barrierColor,
  routeSettings: routeSettings,
  backgroundColor: Colors.transparent,
  builder: (sheetContext) => AnimatedPadding(
    duration: SliDurations.normal,
    curve: Curves.easeOut,
    padding: EdgeInsets.only(
      bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
    ),
    child: builder(sheetContext),
  ),
);

class SliBottomSheetFrame extends StatelessWidget {
  const SliBottomSheetFrame({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.showCloseButton = true,
    this.onClose,
    this.height,
    this.maxHeight,
    this.safeAreaBottom = true,
    this.contentPadding = EdgeInsets.zero,
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: SliTouchTarget.minimumWidth + SliSpacing.sm,
      vertical: SliSpacing.md,
    ),
    this.titleTextAlign = TextAlign.center,
    this.titleStyle,
    this.backgroundColor,
    this.borderRadius = SliRadii.lg,
    this.showDivider = true,
  }) : assert(height == null || height > 0),
       assert(maxHeight == null || maxHeight > 0),
       assert(borderRadius >= 0);

  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool showCloseButton;
  final VoidCallback? onClose;
  final double? height;
  final double? maxHeight;
  final bool safeAreaBottom;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry headerPadding;
  final TextAlign titleTextAlign;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final bool showDivider;

  bool get _showHeader =>
      title != null ||
      subtitle != null ||
      leading != null ||
      trailing != null ||
      showCloseButton;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight =
        mediaQuery.size.height - mediaQuery.padding.top - SliSpacing.lg;
    final requestedMaxHeight = maxHeight ?? availableHeight;
    final effectiveMaxHeight = requestedMaxHeight > availableHeight
        ? availableHeight
        : requestedMaxHeight;
    final effectiveHeight = height?.clamp(0.0, effectiveMaxHeight).toDouble();
    final colors = context.sliColors;

    final body = SafeArea(
      top: false,
      bottom: safeAreaBottom,
      child: Padding(padding: contentPadding, child: child),
    );

    final content = Column(
      mainAxisSize: effectiveHeight == null
          ? MainAxisSize.min
          : MainAxisSize.max,
      children: [
        if (_showHeader) _buildHeader(context, colors),
        if (_showHeader && showDivider)
          Divider(height: 1, thickness: 1, color: colors.border),
        if (effectiveHeight == null)
          Flexible(fit: FlexFit.loose, child: body)
        else
          Expanded(child: body),
      ],
    );

    return Material(
      color: backgroundColor ?? colors.background,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      child: SizedBox(
        width: double.infinity,
        height: effectiveHeight,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: effectiveMaxHeight),
          child: content,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, SliColors colors) {
    final effectiveTrailing =
        trailing ??
        (showCloseButton
            ? _SliBottomSheetCloseButton(onPressed: onClose)
            : null);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: SliTouchTarget.minimumHeight,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: headerPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title case final value?)
                    Semantics(
                      header: true,
                      child: Text(
                        value,
                        textAlign: titleTextAlign,
                        style:
                            titleStyle ??
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: colors.foreground,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  if (subtitle case final value?) ...[
                    const SizedBox(height: SliSpacing.xs),
                    Text(
                      value,
                      textAlign: titleTextAlign,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (leading != null) PositionedDirectional(start: 0, child: leading!),
          if (effectiveTrailing != null)
            PositionedDirectional(end: 0, child: effectiveTrailing),
        ],
      ),
    );
  }
}

class _SliBottomSheetCloseButton extends StatelessWidget {
  const _SliBottomSheetCloseButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: MaterialLocalizations.of(context).closeButtonLabel,
    child: ExcludeSemantics(
      child: IconButton(
        constraints: const BoxConstraints.tightFor(
          width: SliTouchTarget.minimumWidth,
          height: SliTouchTarget.minimumHeight,
        ),
        tooltip: MaterialLocalizations.of(context).closeButtonLabel,
        onPressed: onPressed ?? () => Navigator.maybePop(context),
        icon: const Icon(Icons.close),
      ),
    ),
  );
}
