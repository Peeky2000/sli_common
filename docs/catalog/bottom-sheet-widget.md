# `BottomSheetWidget` — Legacy compatibility

- **Category:** Feedback / Overlay
- **Status:** Deprecated
- **Public import:** `package:sli_common/sli_common.dart`
- **Source:** [`lib/bottom_sheet_widget.dart`](../../lib/bottom_sheet_widget.dart)
- **Example:** [`example/lib/main.dart`](../../example/lib/main.dart)
- **Preview:** [`catalog-pilot-light.png`](../../test/goldens/catalog-pilot-light.png), [`catalog-pilot-dark.png`](../../test/goldens/catalog-pilot-dark.png)

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

## Replacement ổn định

Stable contract đã tách hai trách nhiệm:

1. `showSliBottomSheet<T>()`: presenter điều phối modal, keyboard,
   dismiss/drag/scroll.
2. `SliBottomSheetFrame`: render header/action/content/safe-area và sizing.

Xem [stable BottomSheet](sli-bottom-sheet.md) và migrate theo compatibility
adapter sau khi behavior của caller đã được kiểm chứng.
