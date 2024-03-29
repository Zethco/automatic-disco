abstract class PermissionManager {
  Future<AppPermissionStatus> requestCameraPermission();

  Future<AppPermissionStatus> requestGalleryPermission();

  Future<AppPermissionStatus> requestNotificationPermission();
}

enum AppPermissionStatus {
  granted,
  denied,

  /// iOs
  restricted,

  /// Android/iOS
  deniedPermantly,

  /// i.e when location permission is granted only when the app is in use
  limited
}
