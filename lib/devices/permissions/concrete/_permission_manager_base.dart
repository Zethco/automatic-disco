import 'package:permission_handler/permission_handler.dart';

import '../abstract/permission_manager.dart';

class PermissionManagerBase extends PermissionManager {
  @override
  Future<AppPermissionStatus> requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status.toAppPermission();
  }

  @override
  Future<AppPermissionStatus> requestGalleryPermission() async {
    var status = await Permission.photos.request();
    return status.toAppPermission();
  }

  @override
  Future<AppPermissionStatus> requestNotificationPermission() async {
    var status = await Permission.notification.request();
    return status.toAppPermission();
  }
}

extension FromStatus on PermissionStatus {
  static const Map<PermissionStatus, AppPermissionStatus> _permissionStatus = {
    PermissionStatus.granted: AppPermissionStatus.granted,
    PermissionStatus.denied: AppPermissionStatus.denied,
    PermissionStatus.restricted: AppPermissionStatus.restricted,
    PermissionStatus.permanentlyDenied: AppPermissionStatus.deniedPermantly,
    PermissionStatus.limited: AppPermissionStatus.limited,
  };

  AppPermissionStatus toAppPermission() =>
      _permissionStatus[this] ?? AppPermissionStatus.denied;
}
