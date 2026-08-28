# Component Catalog

Catalog là mục lục chính thức để trả lời bốn câu hỏi trước khi dùng một widget:

1. Tên public API là gì?
2. Hình dạng/variant chính ra sao?
3. API đang stable, legacy, experimental hay deprecated?
4. Source, demo và test nằm ở đâu?

## Foundation và component stable

| Category | API | Status | Preview/usage | Source | Test |
|---|---|---|---|---|---|
| Foundation | `SliColors`, `SliTheme`, `SliSpacing`, `SliRadii`, `SliDurations` | Stable | [Architecture](../architecture.md) | [`lib/src/foundation`](../../lib/src/foundation/) | [`sli_theme_test.dart`](../../test/foundation/sli_theme_test.dart) |
| Integration | `SliShadcnScope` | Stable | [Architecture](../architecture.md) | [`sli_shadcn_scope.dart`](../../lib/src/shadcn/sli_shadcn_scope.dart) | Covered through component tests |
| Action | `SliButton` | Stable | [Details](sli-button.md) | [`sli_button.dart`](../../lib/src/components/sli_button.dart) | [`sli_button_test.dart`](../../test/components/sli_button_test.dart) |
| Container | `SliSurface` | Stable | [Details](sli-surface.md) | [`sli_surface.dart`](../../lib/src/components/sli_surface.dart) | [Pilot golden](../../test/goldens/catalog-pilot.png) |

## Pilot và legacy

| Category | API | Status | Details |
|---|---|---|---|
| Overlay | `BottomSheetWidget` | Legacy / candidate | [BottomSheet pilot](bottom-sheet-widget.md) |
| All legacy exports | Nhiều API | Legacy | [Legacy inventory](legacy-inventory.md) |

## Cách tìm nhanh

- Làm CTA/button: dùng `SliButton`.
- Cần card/surface trung tính: dùng `SliSurface`.
- Cần bottom sheet: đọc [pilot](bottom-sheet-widget.md) trước; API hiện tại chỉ
  là content frame, không phải modal presenter hoàn chỉnh.
- Không tìm thấy: kiểm tra [legacy inventory](legacy-inventory.md), sau đó mới
  đề xuất component mới.

## Maturity gate

Một component chỉ được đánh dấu **Stable** khi có:

- public API semantic và không leak implementation Shadcn;
- theme light/dark phù hợp;
- interaction/disabled/loading contract nếu có;
- semantics/accessibility phù hợp;
- example chạy được và test liên quan;
- tài liệu usage, source và migration note.

Khi thêm catalog page, bắt đầu từ
[component-template.md](component-template.md).
