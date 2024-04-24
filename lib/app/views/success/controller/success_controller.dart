import 'package:get/get.dart';
import 'package:kostrushapp/app/arguments/success_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class SuccessController extends BaseController<SuccessArgument, NoState> {
  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    _startSuccess();
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  Future<void> _startSuccess() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    switch (arguments.context) {
      case OtpPusrposeEnum.SIGNUP:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;
      case OtpPusrposeEnum.FORGOT_PASSWORD:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;
      default:
        break;
    }
  }
}
