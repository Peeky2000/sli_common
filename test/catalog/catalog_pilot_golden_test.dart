import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Future.wait([
      _loadFlutterFont('Roboto', 'Roboto-Regular.ttf'),
      _loadFlutterFont('MaterialIcons', 'MaterialIcons-Regular.otf'),
    ]);
  });

  for (final brightness in Brightness.values) {
    testWidgets('catalog pilot ${brightness.name} preview stays reviewable', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(720, 1100));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _catalogTheme(Brightness.light),
          darkTheme: _catalogTheme(Brightness.dark),
          themeMode: brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const _CatalogPilot(),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(_CatalogPilot),
        matchesGoldenFile('../goldens/catalog-pilot-${brightness.name}.png'),
      );
    });
  }
}

ThemeData _catalogTheme(Brightness brightness) {
  final theme = brightness == Brightness.dark
      ? SliTheme.dark()
      : SliTheme.light();
  return theme.copyWith(
    textTheme: theme.textTheme.apply(fontFamily: 'Roboto'),
    primaryTextTheme: theme.primaryTextTheme.apply(fontFamily: 'Roboto'),
  );
}

Future<void> _loadFlutterFont(String family, String fileName) async {
  var directory = File(Platform.resolvedExecutable).parent;
  while (directory.parent.path != directory.path) {
    final font = File(
      '${directory.path}/bin/cache/artifacts/material_fonts/$fileName',
    );
    if (font.existsSync()) {
      final bytes = await font.readAsBytes();
      final data = ByteData.sublistView(bytes);
      await (FontLoader(family)..addFont(Future.value(data))).load();
      return;
    }
    directory = directory.parent;
  }
  throw StateError('Không tìm thấy Flutter material font: $fileName');
}

class _CatalogPilot extends StatelessWidget {
  const _CatalogPilot();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('sli_common catalog pilot')),
    body: ListView(
      padding: const EdgeInsets.all(SliSpacing.lg),
      children: [
        Text(
          'Stable: SliSurface',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: SliSpacing.sm),
        const SliSurface(
          child: Text('Semantic surface with light/dark tokens'),
        ),
        const SizedBox(height: SliSpacing.xl),
        Text(
          'Stable: SliButton',
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
        const SizedBox(height: SliSpacing.lg),
        Text(
          'Stable: SliBottomSheetFrame',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: SliSpacing.sm),
        SizedBox(
          height: 280,
          child: SliBottomSheetFrame(
            title: 'Bộ lọc',
            height: 280,
            onClose: () {},
            child: const Center(child: Text('Nội dung bottom sheet')),
          ),
        ),
      ],
    ),
  );
}
