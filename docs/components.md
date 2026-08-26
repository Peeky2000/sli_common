# Component Contract

Every `Sli*` component defines:

- variants and sizes as enums rather than loosely related booleans;
- enabled, disabled, loading, and error behavior where applicable;
- semantic labels and keyboard/focus behavior;
- a minimum 48x48 interactive target;
- light and dark theme behavior through semantic tokens;
- stable constructor names and migration notes for breaking changes.

## Current foundation components

| Component | Variants |
|---|---|
| `SliButton` | primary, secondary, outline, ghost, destructive |
| `SliSurface` | bordered or borderless semantic surface |
| `SliShadcnScope` | Shadcn theme and overlay bridge |
