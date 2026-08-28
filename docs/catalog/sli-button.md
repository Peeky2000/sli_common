# `SliButton`

- **Category:** Action
- **Status:** Stable
- **Public import:** `package:sli_common/sli_common.dart`
- **Source:** [`lib/src/components/sli_button.dart`](../../lib/src/components/sli_button.dart)
- **Example:** [`example/lib/main.dart`](../../example/lib/main.dart)
- **Tests:** [`test/components/sli_button_test.dart`](../../test/components/sli_button_test.dart)

## Dùng khi nào?

Dùng cho CTA và action phổ biến. `SliButton` giữ API app ổn định trong khi
Shadcn chỉ là implementation detail bên trong package.

## Preview

![SliButton variants](../../test/goldens/catalog-pilot.png)

## Cách dùng tối thiểu

```dart
SliButton(
  label: 'Tiếp tục',
  onPressed: submit,
  variant: SliButtonVariant.primary,
  expand: true,
)
```

## API và variants

| Thuộc tính | Ý nghĩa | Default |
|---|---|---|
| `variant` | `primary`, `secondary`, `outline`, `ghost`, `destructive` | `primary` |
| `size` | `small`, `medium`, `large` | `medium` |
| `isLoading` | Hiện progress và vô hiệu hóa callback | `false` |
| `expand` | Chiếm toàn bộ chiều ngang | `false` |
| `leading` / `trailing` | Icon/widget hai phía | `null` |
| `semanticLabel` | Nhãn accessibility thay cho text hiển thị | `label` |

`onPressed: null` tạo disabled state. Khi `isLoading == true`, callback không
được gọi và leading/trailing tạm ẩn.

## Không dùng khi nào?

- Action chỉ là icon: hiện chưa có stable `SliIconButton`.
- Link inline trong đoạn text: dùng link/text component phù hợp thay vì ép
  button thành text link.

## Theme và accessibility

Component đọc theme từ `SliTheme`, tự bọc `SliShadcnScope`, và expose semantics
button/enabled/label. App không import `shadcn_flutter` trực tiếp.
