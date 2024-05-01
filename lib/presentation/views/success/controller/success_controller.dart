import 'package:get/get.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/presentation/views/success/argument/success_argument.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';

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

  String get successAsset => _successAsset();

  String _successAsset() {
    switch (arguments.context) {
      case OtpPusrposeEnum.changePassword:
        return ImageAssetConstant.successAlt;
      default:
        return ImageAssetConstant.success;
    }
  }

  Future<void> _startSuccess() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    switch (arguments.context) {
      case OtpPusrposeEnum.signUp:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;
      case OtpPusrposeEnum.forgotPassword:
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        break;

      case OtpPusrposeEnum.changePassword:
        Get.back();
        Get.back();
        Get.back();
        break;

      default:
        break;
    }
  }
}
