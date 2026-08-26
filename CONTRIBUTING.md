# Contributing

## Component checklist

1. Search the public barrel and legacy widgets before adding a component.
2. Put reusable implementation under `lib/src`; export only intentional API from
   `lib/sli_common.dart`.
3. Depend on semantic tokens, not application colors or spacing constants.
4. Define variants and disabled/loading/error behavior explicitly.
5. Add semantics and preserve a minimum 48x48 interactive target.
6. Add widget tests for behavior, light/dark themes, and public imports.
7. Add a changelog entry. Deprecate before removing a legacy API.

Run `flutter pub get`, `dart format lib test example`, `flutter analyze`, and
`flutter test` before committing.
