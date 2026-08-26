import 'package:flutter/material.dart';
import 'package:sli_common/sli_common.dart';

void main() => runApp(const ComponentShowcase());

class ComponentShowcase extends StatelessWidget {
  const ComponentShowcase({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'sli_common showcase',
    theme: SliTheme.light(),
    darkTheme: SliTheme.dark(),
    home: const _ShowcaseScreen(),
  );
}

class _ShowcaseScreen extends StatelessWidget {
  const _ShowcaseScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('sli_common')),
    body: ListView(
      padding: const EdgeInsets.all(SliSpacing.lg),
      children: [
        const SliSurface(
          child: Text('Semantic surface with light/dark tokens'),
        ),
        const SizedBox(height: SliSpacing.lg),
        for (final variant in SliButtonVariant.values) ...[
          SliButton(
            label: variant.name,
            variant: variant,
            onPressed: () {},
            expand: true,
          ),
          const SizedBox(height: SliSpacing.sm),
        ],
      ],
    ),
  );
}
