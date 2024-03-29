import 'package:package_info_plus/package_info_plus.dart';

import '../abstract/app_platform.dart';
import '../abstract/platform_info.dart';

class PlatformInfoImpl extends PlatformInfo {
  final AppPlatform appPlatform;

  PlatformInfoImpl(this.appPlatform);

  @override
  get isDesktopOS =>
      appPlatform.isMacOS || appPlatform.isLinux || appPlatform.isWindows;

  @override
  get isAppOS => appPlatform.isIOS || appPlatform.isAndroid;

  @override
  get isWeb => appPlatform.isWeb;

  @override
  get isAndroid => appPlatform.isAndroid;

  @override
  get isIOS => appPlatform.isIOS;

  @override
  Future<String> get version async {
    final packageInfo = await PackageInfo.fromPlatform();
    return 'v.${packageInfo.version}.${packageInfo.buildNumber}';
  }

  @override
  get currentPlatform => appPlatform.currentPlatform;

  @override
  get getCurrentPlatformType => currentPlatform.name;
}
