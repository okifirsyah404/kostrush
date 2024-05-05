import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/data/enum/otp_purpose_enum.dart';
import 'package:kostrushapp/data/local/share_pref/storage_preference.dart';
import 'package:kostrushapp/data/network/response/user_profile_response.dart';
import 'package:kostrushapp/presentation/views/otp/argument/otp_argument.dart';
import 'package:kostrushapp/res/local_data/storage_constant.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../domain/repository/main_repository.dart';
import '../../../../../components/dialog/main_dialog.dart';

class ProfileController
    extends BaseController<NoArguments, UserProfileResponse> {
  final _repository = Get.find<MainRepository>();
  final _storage = Get.find<StoragePreference>();

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
    emitLoading();

    final data = await _repository.fetchProfile();

    data.fold(
      (exception) {
        emitError(exception.message);
        Get.dialog(
          MainDialog.error(
            message: exception.message ?? 'Error',
          ),
        );
      },
      (data) {
        emitSuccess(data);
      },
    );
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
      AppRoutes.otp,
      arguments: OtpArgument(
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

  void signOut() async {
    await _storage.deleteSecureData(StorageConstant.sessionToken);
    Get.offAllNamed(AppRoutes.signIn);
  }
}
