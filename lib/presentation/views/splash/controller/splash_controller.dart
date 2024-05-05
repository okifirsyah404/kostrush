import 'package:dartx/dartx.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/local/share_pref/storage_preference.dart';

class SplashController extends BaseController<NoArguments, NoState> {
  RxnString appVersion = RxnString(null);

  final packageInfo = Get.find<PackageInfo>();
  final _storage = Get.find<StoragePreference>();

  @override
  void initComponent() {}

  @override
  void onObserve() {
    _startSplash();
  }

  @override
  Future<void> onProcess() async {
    appVersion.value = packageInfo.version;
  }

  @override
  void disposeComponent() {
    appVersion.value = null;
    appVersion.close();
  }

  Future<void> _startSplash() async {
    final isLogin =
        (await _storage.readSecureData(StorageConstant.sessionToken))
            .isNotNullOrEmpty;

    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    if (isLogin) {
      Get.offNamed(AppRoutes.main);
    } else {
      Get.offNamed(AppRoutes.signIn);
    }
  }
}
