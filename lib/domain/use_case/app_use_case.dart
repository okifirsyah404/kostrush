import 'package:get/get.dart';
import 'package:kostrushapp/utils/service/permission_service.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class ApplicationUseCase with PermissionServices {
  final _logger = Get.find<Logger>();

  Future<bool> handleCameraGalleryPermission() async {
    var permissions = await requestCameraGalleryPermission();

    _logger.d(permissions);

    if (permissions[Permission.camera] == PermissionStatus.granted) {
      _logger.d("Granted");
      return true;
    }

    _logger.e("Denied");
    return false;
  }
}
