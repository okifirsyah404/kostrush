import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';
import 'package:kostrushapp/presentation/views/otp/argument/otp_argument.dart';
import 'package:kostrushapp/presentation/views/reset_password/argument/reset_password_argument.dart';
import 'package:kostrushapp/presentation/views/success/argument/success_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../../res/routes/app_routes.dart';

class OtpController extends BaseController<OtpArgument, NoState> {
  late TextEditingController otpController;

  @override
  void initComponent() {
    otpController = TextEditingController();
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
    otpController.dispose();
  }

  void sendOtp() {
    switch (arguments.context) {
      case OtpPusrposeEnum.signUp:
        Get.toNamed(
          AppRoutes.success,
          arguments: SuccessArgument(
              context: arguments.context,
              title: "Registrasi Berhasil",
              description:
                  "Akun anda berhasil terdaftar. Silahkan login untuk melanjutkan.",
              buttonText: ""),
        );
        break;

      case OtpPusrposeEnum.forgotPassword:
        Get.toNamed(
          AppRoutes.resetPassword,
          arguments: ResetPasswordArgument(
            email: arguments.email,
            context: arguments.context,
          ),
        );

      case OtpPusrposeEnum.changePassword:
        Get.toNamed(
          AppRoutes.changePassword,
          arguments: ChangePasswordArgument(
            email: arguments.email,
          ),
        );

      default:
        break;
    }
  }
}
