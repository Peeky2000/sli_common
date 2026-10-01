# `ExpandedWidget` — chuyển động mở/đóng legacy

- **Category:** Layout / animation
- **Status:** Legacy (API chưa theo facade `Sli*`)
- **Public import:** `package:sli_common/sli_common.dart`
- **Source:** [`lib/expanded_widget.dart`](../../lib/expanded_widget.dart)
- **Tests:** [`expanded_widget_test.dart`](../../test/legacy/expanded_widget_test.dart)

## Dùng khi nào?

Cần mở/đóng một vùng nội dung theo chiều dọc hoặc ngang, giữ widget con trong
tree khi đang đóng. Code mới đơn giản có thể dùng thẳng `SizeTransition` của
Flutter; component này được giữ để tương thích và tái sử dụng hành vi cũ.

```dart
ExpandedWidget(
  expand: showDetails,
  axis: Axis.vertical,
  child: const Text('Chi tiết'),
)
```

| Tham số | Ý nghĩa | Mặc định |
|---|---|---|
| `expand` | `true` mở, `false` đóng | `false` |
| `axis` | Trục hoạt ảnh | `Axis.vertical` |
| `curve` | Đường cong animation | `Curves.easeInOut` |
| `duration` | Thời gian animation | 500 ms |
| `child` | Nội dung | `null` |

Chiều dọc căn đáy, chiều ngang căn phải; widget test khóa cả hai trục và quá
trình mở/đóng. Component không quản lý semantics cho nội dung bị thu gọn, không
tự dispose tài nguyên của `child`, và chưa có gallery/golden light/dark. Vì vậy
chưa đánh dấu stable. Ảnh tĩnh không diễn tả đầy đủ chuyển động; xem test hoặc
chạy ví dụ trong app để đánh giá animation.

App `bloc_cubit_base` đã chuyển bản trùng tại `lib/core/widget/expanded_widget.dart`
thành adapter deprecated. Caller mới nên import public barrel của package;
không import source nội bộ.
