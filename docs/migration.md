# Migration widget legacy

1. Thay design constant cục bộ bằng `SliColors`, `SliSpacing` và `SliRadii`.
2. Thay button trùng bằng `SliButton` nhưng phải giữ nguyên hành vi màn hình.
3. Ưu tiên `SliSurface` cho panel/card dùng lại.
4. Với bottom sheet, dùng `showSliBottomSheet` làm presenter và
   `SliBottomSheetFrame` làm content frame.
5. Giữ widget legacy cho đến khi replacement có parity test.
6. Thêm `@Deprecated`, replacement và changelog trước khi xóa API cũ.

Không migrate mọi widget trong một thay đổi. Làm theo từng family để visual và
interaction regression vẫn review được.
