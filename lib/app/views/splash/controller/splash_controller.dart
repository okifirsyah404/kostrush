import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../base/base_controller.dart';

class SplashController extends BaseController<NoArguments, NoState> {
  RxnString appVersion = RxnString(null);

  final packageInfo = Get.find<PackageInfo>();

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
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    Get.offNamed(AppRoutes.signIn);
  }
}
