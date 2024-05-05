import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/presentation/views/account_sign_up/argument/account_sign_up_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';
import '../../../../data/enum/otp_purpose_enum.dart';
import '../../otp/argument/otp_argument.dart';

class AccountSignUpController
    extends BaseController<AccountSignUpArgument, NoState> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initComponent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void navigateToOtp() {
    Get.toNamed(
      AppRoutes.otp,
      arguments: OtpArgument(
        context: OtpPurposeEnum.signUp,
        email: emailController.text,
      ),
    );
  }
}
