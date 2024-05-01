import 'package:permission_handler/permission_handler.dart';

mixin PermissionServices {
  Future<void> requestOpenAppSettings() async {
    var openSetting = await openAppSettings();
  }

  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.storage.request();
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await Permission.location.request();
  }

  Future<PermissionStatus> requestGalleryPermission() async {
    return await Permission.storage.request();
  }

  Future<Map<Permission, PermissionStatus>>
      requestCameraGalleryPermission() async {
    return await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  Future<Map<Permission, PermissionStatus>>
      requestAllRequiredPermission() async {
    return await [
      Permission.camera,
      Permission.storage,
      Permission.notification,
    ].request();
  }
}
