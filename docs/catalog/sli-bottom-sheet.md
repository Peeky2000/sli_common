# `SliBottomSheetFrame` và `showSliBottomSheet`

- **Category:** Feedback / Overlay
- **Status:** Stable
- **Public import:** `package:sli_common/sli_common.dart`
- **Source:** [`lib/src/components/sli_bottom_sheet.dart`](../../lib/src/components/sli_bottom_sheet.dart)
- **Example:** [`example/lib/main.dart`](../../example/lib/main.dart)
- **Tests:** [`test/components/sli_bottom_sheet_test.dart`](../../test/components/sli_bottom_sheet_test.dart)

## Khi nào dùng gì?

- `showSliBottomSheet<T>` điều phối modal route: dismiss, drag, root navigator,
  scroll-controlled, barrier và keyboard inset.
- `SliBottomSheetFrame` render anatomy: header, subtitle, action hai phía,
  divider, content, safe area và sizing.
- Nếu flow đã có presenter riêng thì chỉ dùng `SliBottomSheetFrame`.

```dart
final result = await showSliBottomSheet<bool>(
  context: context,
  builder: (sheetContext) => SliBottomSheetFrame(
    title: 'Xác nhận',
    subtitle: 'Thao tác này có thể hoàn tác.',
    child: SliButton(
      label: 'Đồng ý',
      onPressed: () => Navigator.pop(sheetContext, true),
    ),
  ),
);
```

## Contract sizing

| Cấu hình | Hành vi |
|---|---|
| Không truyền `height` | Co theo nội dung, giới hạn bởi `maxHeight` hoặc viewport |
| Truyền `height` | Frame có chiều cao cố định nhưng không vượt viewport |
| `safeAreaBottom: true` | Content tránh home indicator |
| `isScrollControlled: true` | Presenter cho phép sheet cao và xử lý keyboard inset |

Close action mặc định dùng `Navigator.maybePop`, có semantics theo
`MaterialLocalizations` và touch target tối thiểu 48×48. Màu nền, text và divider
dùng semantic token nên chạy được với cả light/dark theme.

## Migration

`BottomSheetWidget` cũ đã deprecated nhưng vẫn được export để caller hiện tại
không gãy. Migrate theo từng flow sau khi đối chiếu behavior; không đổi hàng
loạt bằng tìm-thay thế.
