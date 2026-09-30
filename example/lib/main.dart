import 'package:flutter/material.dart';
import 'package:sli_common/sli_common.dart';

void main() => runApp(const ComponentShowcase());

class ComponentShowcase extends StatelessWidget {
  const ComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'sli_common showroom',
    theme: SliTheme.light(),
    darkTheme: SliTheme.dark(),
    builder: (context, child) =>
        SliShadcnScope(child: child ?? const SizedBox.shrink()),
    home: const _ShowcaseScreen(),
  );
}

class _ShowcaseScreen extends StatelessWidget {
  const _ShowcaseScreen();

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('sli_common showroom'),
        bottom: const TabBar(
          tabs: [
            Tab(text: 'Stable'),
            Tab(text: 'Bottom sheet'),
            Tab(text: 'Catalog'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [_StableComponents(), _BottomSheetPilot(), _CatalogHelp()],
      ),
    ),
  );
}

class _StableComponents extends StatelessWidget {
  const _StableComponents();

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(SliSpacing.lg),
    children: [
      Text('Surface', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: SliSpacing.sm),
      const SliSurface(child: Text('Semantic surface with light/dark tokens')),
      const SizedBox(height: SliSpacing.xl),
      Text('Button variants', style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: SliSpacing.sm),
      for (final variant in SliButtonVariant.values) ...[
        SliButton(
          label: variant.name,
          variant: variant,
          onPressed: () {},
          expand: true,
        ),
        const SizedBox(height: SliSpacing.sm),
      ],
      const SliButton(label: 'disabled', expand: true),
      const SizedBox(height: SliSpacing.sm),
      SliButton(
        label: 'loading',
        isLoading: true,
        onPressed: () {},
        expand: true,
      ),
    ],
  );
}

class _BottomSheetPilot extends StatelessWidget {
  const _BottomSheetPilot();

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(SliSpacing.lg),
    children: [
      const SliSurface(
        child: Text(
          'BottomSheetWidget hiện là legacy content frame, chưa phải stable '
          'modal presenter.',
        ),
      ),
      const SizedBox(height: SliSpacing.lg),
      SliButton(
        label: 'Mở BottomSheet pilot',
        expand: true,
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BottomSheetWidget(
            title: 'Bộ lọc',
            height: 420,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Center(child: Text('Nội dung bottom sheet')),
          ),
        ),
      ),
    ],
  );
}

class _CatalogHelp extends StatelessWidget {
  const _CatalogHelp();

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(SliSpacing.lg),
    children: const [
      SliSurface(
        child: Text(
          'README là quick gallery. docs/catalog chứa usage, maturity, source '
          'và test của từng component. Hãy tìm catalog trước khi tạo widget mới.',
        ),
      ),
    ],
  );
}
