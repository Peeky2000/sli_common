# Legacy Migration

1. Replace app-local design constants with `SliColors`, `SliSpacing`, and `SliRadii`.
2. Replace duplicated buttons with `SliButton` while preserving screen behavior.
3. Prefer `SliSurface` for new reusable panels/cards.
4. Keep legacy widgets in place until their replacement has parity tests.
5. Add `@Deprecated` with a replacement and changelog entry before removal.

Do not migrate every widget in one change. Migrate by component family so visual and
interaction regressions remain reviewable.
