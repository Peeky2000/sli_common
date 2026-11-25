# Changelog

## Unreleased

- Nâng `fluttertoast` lên 10 và `device_info_plus` lên 12: hai plugin này
  chưa có Swift Package Manager ở bản cũ, chặn app chuyển iOS sang SPM.
  API dùng trong `PermissionUtil` không đổi.
- Chuyển sang Flutter 3.50.0: import `package:material_ui` và
  `package:cupertino_ui` thay cho `material.dart`/`cupertino.dart` đã
  deprecated; file l10n sinh ra có header bỏ qua deprecation của
  `flutter_localizations`. CI chạy Flutter 3.50.0.
- Đồng bộ `ExpandedWidget` ngang với app adapter (căn phải khi mở/đóng),
  khóa hành vi hai trục bằng widget tests.
- Thêm component catalog, maturity status và inventory cho 45/45 public export.
- Mở rộng example thành showroom cho component stable và BottomSheet pilot.
- Thêm golden preview dùng font thật cùng gate kiểm tra export phải có catalog.
- Khóa Shadcn facade bằng semantics/minimum touch-target tests cho toàn bộ
  `SliButton` variant/size, `SliSurface` tests và golden light/dark.
- Thêm stable `showSliBottomSheet` + `SliBottomSheetFrame` với keyboard inset,
  safe area, viewport-safe sizing, light/dark và accessibility tests; deprecated
  `BottomSheetWidget` cũ để migration có kiểm soát.
- Dọn analyzer toàn package từ 241 finding xuống 0: cập nhật syntax/API Flutter,
  loại bỏ dead code calendar, sửa export date-range và guard `BuildContext`
  trong permission flow. Thêm smoke tests cho calendar legacy; giữ tên enum và
  async back callback cũ bằng ngoại lệ tương thích có chú thích.

## 1.1.0

- Add semantic color, spacing, radius, duration, and touch-target tokens.
- Add light/dark `SliTheme` extensions.
- Add Shadcn-backed `SliButton`, `SliSurface`, and `SliShadcnScope`.
- Establish public API, architecture, migration, contribution, and license docs.
- Keep legacy exports for backward compatibility.

## 1.0.0

- Initial personal widget collection.
