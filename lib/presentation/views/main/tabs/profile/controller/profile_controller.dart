import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../../base/base_controller.dart';

class ProfileController extends BaseController<NoArguments, NoState> {
  @override
  void initComponent() {
    // TODO: implement initComponent
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
    // TODO: implement disposeComponent
  }

  void navigateToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }

  void navigateToDetailProfile() {
    Get.toNamed(AppRoutes.detailProfile);
  }

  void navigateToChangePassword() {
    Get.toNamed(
      AppRoutes.changePassword,
      arguments: ChangePasswordArgument(
        context: OtpPurposeEnum.changePassword,
        email: "test@email.com",
      ),
    );
  }

  void navigateToPolicy() {
    Get.toNamed(AppRoutes.policy);
  }

  void navigateToAboutUs() {
    Get.toNamed(AppRoutes.aboutUs);
  }

  void navigateToHelpCenter() {
    Get.toNamed(AppRoutes.helpCenter);
  }

  void signOut() {
    Get.offAllNamed(AppRoutes.signIn);
  }
}
