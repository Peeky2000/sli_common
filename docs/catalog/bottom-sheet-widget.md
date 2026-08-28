# `BottomSheetWidget` — Pilot

- **Category:** Feedback / Overlay
- **Status:** Legacy / candidate for redesign
- **Public import:** `package:sli_common/sli_common.dart`
- **Source:** [`lib/bottom_sheet_widget.dart`](../../lib/bottom_sheet_widget.dart)
- **Example:** [`example/lib/main.dart`](../../example/lib/main.dart)
- **Preview:** [`catalog-pilot.png`](../../test/goldens/catalog-pilot.png)

## Contract hiện tại

`BottomSheetWidget` chỉ xây **khung nội dung** gồm title, close/back action,
right action, child và safe area. Nó không tự gọi `showModalBottomSheet`, không
quản lý keyboard inset và không phải service/presenter hoàn chỉnh.

```dart
showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => const BottomSheetWidget(
    title: 'Bộ lọc',
    height: 420,
    child: Center(child: Text('Nội dung bộ lọc')),
  ),
);
```

## API đáng chú ý

| Thuộc tính | Ý nghĩa | Default |
|---|---|---|
| `title` | Tiêu đề giữa header | `null` |
| `child` | Nội dung bắt buộc | — |
| `action` | Action phía phải header | `null` |
| `height` | Chiều cao frame | `2/3` màn hình |
| `isIntrinsicHeight` | Co theo nội dung | `false` |
| `safeAreaTop` / `safeAreaBottom` | Safe-area cho content | `false` / `true` |
| `showHeader` | Hiện header/divider | `true` |
| `radius` | Bo góc trên | `10` |

## Vì sao chưa Stable?

- tên chưa theo stable facade `Sli*`;
- background mặc định nullable và có global mutable
  `defaultBackgroundColor`;
- content luôn dùng `Expanded`, contract intrinsic/scroll cần kiểm tra thêm;
- chưa có keyboard inset, draggable/scrollable và dismissal contract thống
  nhất;
- chưa có accessibility/semantics test đầy đủ.

## Hướng stable dự kiến

Tách hai trách nhiệm:

1. `showSliBottomSheet<T>()`: presenter điều phối modal, keyboard, safe-area,
   dismiss/drag/scroll.
2. Các primitive frame/header/action bar: chỉ render anatomy.

Chưa migrate `lib/core/widget/bottom_sheet_widget.dart` của app sang component
này cho đến khi behavior matrix và parity test hoàn tất.
