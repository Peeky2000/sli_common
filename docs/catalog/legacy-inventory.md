# Public Export Inventory

Inventory này phản ánh toàn bộ public barrel `lib/sli_common.dart`. “Legacy”
nghĩa là API vẫn dùng được nhưng chưa vượt maturity gate của `Sli*`.

Ngày 2026-11-25 bộ legacy được rút gọn: giữ widget app đang dùng và widget khó
tự viết lại cho đúng (lịch, thước cuộn, marquee, viền chấm, vuốt, xem ảnh), bỏ
23 widget agent viết lại nhanh hơn đọc API cũ hoặc đã có trong
`material_ui`/Shadcn (badge, các kiểu text gradient/nhấp nháy, nút đáy, tab bar,
progress, dots indicator, mini player, picker nhiều ảnh, logger). Cần lại thì
lấy từ lịch sử git trước commit này.

## Foundation và stable surface

| Export | API chính | Status |
|---|---|---|
| `src/components/sli_button.dart` | `SliButton` | Stable |
| `src/components/sli_bottom_sheet.dart` | `SliBottomSheetFrame`, `showSliBottomSheet` | Stable |
| `src/components/sli_surface.dart` | `SliSurface` | Stable |
| `src/foundation/sli_colors.dart` | `SliColors` | Stable |
| `src/foundation/sli_icons.dart` | `SliIcons` (Lucide qua shadcn_flutter) | Stable |
| `src/foundation/sli_theme.dart` | `SliTheme` | Stable |
| `src/foundation/sli_tokens.dart` | Spacing/radius/duration tokens | Stable |
| `src/shadcn/sli_shadcn_scope.dart` | `SliShadcnScope` | Stable |

## Kit (sinh từ the-forge-design)

| Export | API chính | Status |
|---|---|---|
| `src/kit/trial_kit/v1_0_0/kit_tokens.dart` | `KitTokens` (theme extension, `KitTokens.theme()`) | Trial — kit `trial-kit@1.0.0` |
| `src/kit/trial_kit/v1_0_0/kit_button.dart` | `SliKitButton` | Trial — kit `trial-kit@1.0.0` |
| `src/kit/trial_kit/v1_0_0/kit_text_field.dart` | `SliKitTextField` | Trial — kit `trial-kit@1.0.0` |
| `src/kit/trial_kit/v1_0_0/kit_otp_field.dart` | `SliKitOtpField` | Trial — kit `trial-kit@1.0.0` |

## Feedback / overlay

| Export | API chính | Status |
|---|---|---|
| `bottom_sheet_widget.dart` | `BottomSheetWidget` | Deprecated |
| `dialog_util.dart` | `DialogUtil` | Legacy |

## Input / form

| Export | API chính | Status |
|---|---|---|
| `base_field.dart` | `BaseField` | Legacy |
| `common_text_field.dart` | `CommonTextField` | Legacy |
| `common_drop_down.dart` | `CommonDropDown` | Legacy |
| `calendar/material/pickers.dart` | Material date/time pickers | Legacy |
| `ruler_scroll.dart` | `RulerScrollWidget` | Legacy |
| `swipe_to.dart` | Swipe interaction | Legacy |

## Display / media

| Export | API chính | Status |
|---|---|---|
| `marquee.dart` | `Marquee` | Legacy |
| `money_widget.dart` | `MoneyWidget` | Legacy |
| `read_more.dart` | Read-more text | Legacy |
| `photo_view_screen.dart` | `PhotoViewScreen` | Legacy |

## Layout / decoration / utility

| Export | API chính | Status |
|---|---|---|
| `expanded_widget.dart` | [`ExpandedWidget`](expanded-widget.md) | Legacy |
| `dotted_border.dart` | Dotted border | Legacy |
| `dotted_decoration.dart` | Dotted decoration | Legacy |
| `permission_utils.dart` | `PermissionUtils` | Legacy utility |

Tổng: **28/28 public exports** đã được phân loại (8 stable foundation/component,
4 kit trial và 16 legacy/compatibility). Khi barrel thay đổi, inventory phải đổi
trong cùng commit.
