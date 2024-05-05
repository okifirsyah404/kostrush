import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../../data/enum/otp_purpose_enum.dart';
import '../../../../res/routes/app_routes.dart';
import '../../otp/argument/otp_argument.dart';

class ForgetPasswordController extends BaseController<NoArguments, NoState> {
  late TextEditingController emailController;

  @override
  void initComponent() {
    emailController = TextEditingController();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    emailController.dispose();
  }

  void navigateToOtp() {
    Get.toNamed(
      AppRoutes.otp,
      arguments: OtpArgument(
        context: OtpPurposeEnum.forgotPassword,
        email: emailController.text,
      ),
    );
  }
}
