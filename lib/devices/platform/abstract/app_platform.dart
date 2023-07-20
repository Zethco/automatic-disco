import 'platform_info.dart';

abstract class AppPlatform {
  get isWeb => false;

  get isMacOS => false;

  get isFuchsia => false;

  get isLinux => false;

  get isWindows => false;

  get isIOS => false;

  get isAndroid => false;

  PlatformType get currentPlatform {
    if (isWeb) return PlatformType.web;
    if (isIOS) return PlatformType.ios;
    if (isAndroid) return PlatformType.android;
    if (isMacOS) return PlatformType.macOs;
    if (isFuchsia) return PlatformType.fuchsia;
    if (isLinux) return PlatformType.linux;
    if (isWindows) return PlatformType.windows;
    return PlatformType.unknown;
  }
}
