# Legacy Public Export Inventory

Inventory này phản ánh toàn bộ public barrel `lib/sli_common.dart` tại ngày
2026-08-28. “Legacy” nghĩa là API vẫn dùng được nhưng chưa vượt maturity gate
của `Sli*`; không đồng nghĩa component sai hoặc phải xóa ngay.

## Foundation và stable surface

| Export | API chính | Status |
|---|---|---|
| `src/components/sli_button.dart` | `SliButton` | Stable |
| `src/components/sli_surface.dart` | `SliSurface` | Stable |
| `src/foundation/sli_colors.dart` | `SliColors` | Stable |
| `src/foundation/sli_theme.dart` | `SliTheme` | Stable |
| `src/foundation/sli_tokens.dart` | Spacing/radius/duration tokens | Stable |
| `src/shadcn/sli_shadcn_scope.dart` | `SliShadcnScope` | Stable |

## Feedback / overlay

| Export | API chính | Status |
|---|---|---|
| `bottom_sheet_widget.dart` | `BottomSheetWidget` | Legacy / pilot |
| `dialog_util.dart` | `DialogUtil` | Legacy |
| `circle_progress.dart` | Circle progress widgets | Legacy |
| `horizontal_progress.dart` | Horizontal progress widgets | Legacy |
| `dots_indicator.dart` | `DotIndicator` | Legacy |

## Input / form

| Export | API chính | Status |
|---|---|---|
| `base_field.dart` | `BaseField` | Legacy |
| `common_text_field.dart` | `CommonTextField` | Legacy |
| `common_drop_down.dart` | `CommonDropDown` | Legacy |
| `calendar/material/pickers.dart` | Material date/time pickers | Legacy |
| `ruler_scroll.dart` | `RulerScrollWidget` | Legacy |
| `swipe_to.dart` | Swipe interaction | Legacy |

## Action / navigation

| Export | API chính | Status |
|---|---|---|
| `bottom_button.dart` | `BottomButton` | Legacy |
| `bottom_2_button.dart` | `Bottom2Button` | Legacy |
| `gradient_button.dart` | `GradientButton` | Legacy |
| `ink_well_button.dart` | `InkwellButton` | Legacy |
| `text_link.dart` | `TextLink` | Legacy |
| `tabbar_widget.dart` | `TabBarWidget` | Legacy |
| `bubble_tab_indicator.dart` | `BubbleTabIndicator` | Legacy |
| `sliver_appbar_delegate.dart` | Sliver app bar delegate | Legacy |

## Display / media

| Export | API chính | Status |
|---|---|---|
| `badge.dart` | `Badge` | Legacy |
| `banner_widget.dart` | `BannerWidget` | Legacy |
| `blink_text.dart` | `BlinkText` | Legacy |
| `gradient_text.dart` | `GradientText` | Legacy |
| `animation_gradient_text.dart` | Animated gradient text | Legacy |
| `marquee.dart` | `Marquee` | Legacy |
| `money_widget.dart` | `MoneyWidget` | Legacy |
| `title_widget.dart` | `TitleWidget` | Legacy |
| `read_more.dart` | Read-more text | Legacy |
| `image_loading.dart` | Image loading widget | Legacy |
| `image_test.dart` | Legacy image helper | Legacy / review |
| `multi_image_picker.dart` | Multi image picker UI | Legacy |
| `photo_view_screen.dart` | `PhotoViewScreen` | Legacy |
| `mini_player.dart` | `MiniPlayer` | Legacy |

## Layout / decoration / utility

| Export | API chính | Status |
|---|---|---|
| `expanded_widget.dart` | Expanded/collapse widget | Legacy |
| `fade_widget.dart` | Fade widget | Legacy |
| `dotted_border.dart` | Dotted border | Legacy |
| `dotted_decoration.dart` | Dotted decoration | Legacy |
| `permission_utils.dart` | `PermissionUtils` | Legacy utility |
| `log.dart` | `Log` | Legacy utility |

Tổng: **45/45 public exports** đã được phân loại (6 stable foundation/component
exports và 39 legacy exports). Khi barrel thay đổi, inventory phải đổi trong
cùng commit.
