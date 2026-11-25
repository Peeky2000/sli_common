import 'package:flutter/widgets.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' show LucideIcons;

/// The icon set for apps built on sli_common: Lucide (ISC license), shipped as
/// a font by shadcn_flutter, so no extra package or asset is needed.
///
/// Use the semantic names below for common actions. For a glyph without a
/// semantic name, add it here (camelCase Lucide name, https://lucide.dev/icons)
/// rather than importing shadcn_flutter in the app. Do not mix in Material
/// `Icons.*` in app UI.
abstract final class SliIcons {
  // Navigation
  static const IconData home = LucideIcons.house;
  static const IconData back = LucideIcons.arrowLeft;
  static const IconData chevronLeft = LucideIcons.chevronLeft;
  static const IconData chevronRight = LucideIcons.chevronRight;
  static const IconData chevronDown = LucideIcons.chevronDown;
  static const IconData menu = LucideIcons.menu;
  static const IconData more = LucideIcons.ellipsisVertical;
  static const IconData close = LucideIcons.x;

  // Actions
  static const IconData search = LucideIcons.search;
  static const IconData filter = LucideIcons.filter;
  static const IconData add = LucideIcons.plus;
  static const IconData remove = LucideIcons.minus;
  static const IconData edit = LucideIcons.pencil;
  static const IconData delete = LucideIcons.trash;
  static const IconData copy = LucideIcons.copy;
  static const IconData share = LucideIcons.share;
  static const IconData download = LucideIcons.download;
  static const IconData upload = LucideIcons.upload;
  static const IconData refresh = LucideIcons.refreshCw;
  static const IconData check = LucideIcons.check;

  // Account and settings
  static const IconData user = LucideIcons.user;
  static const IconData settings = LucideIcons.settings;
  static const IconData notification = LucideIcons.bell;
  static const IconData lock = LucideIcons.lock;
  static const IconData logout = LucideIcons.logOut;
  static const IconData visible = LucideIcons.eye;
  static const IconData hidden = LucideIcons.eyeOff;

  // Contact and media
  static const IconData mail = LucideIcons.mail;
  static const IconData phone = LucideIcons.phone;
  static const IconData camera = LucideIcons.camera;
  static const IconData image = LucideIcons.image;
  static const IconData calendar = LucideIcons.calendar;
  static const IconData time = LucideIcons.clock;
  static const IconData location = LucideIcons.mapPin;
  static const IconData scan = LucideIcons.scanLine;
  static const IconData qrCode = LucideIcons.qrCode;

  // Status
  static const IconData info = LucideIcons.info;
  static const IconData success = LucideIcons.circleCheck;
  static const IconData warning = LucideIcons.triangleAlert;
  static const IconData error = LucideIcons.circleAlert;
  static const IconData online = LucideIcons.wifi;
  static const IconData offline = LucideIcons.wifiOff;
  static const IconData favorite = LucideIcons.heart;
  static const IconData rating = LucideIcons.star;

  // Commerce and delivery
  static const IconData cart = LucideIcons.shoppingCart;
  static const IconData card = LucideIcons.creditCard;
  static const IconData wallet = LucideIcons.wallet;
  static const IconData parcel = LucideIcons.package;
  static const IconData delivery = LucideIcons.truck;
}
