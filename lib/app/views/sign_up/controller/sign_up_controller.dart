import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/app/arguments/account_sign_up_argument.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';

class SignUpController extends BaseController<NoArguments, NoState> {
  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  RxBool isAgree = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
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
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    isAgree.close();
  }

  void navigateToAccountSignUp() {
    Get.toNamed(
      AppRoutes.signUpAccount,
      arguments: AccountSignUpArgument(
        name: nameController.text,
        phoneNumber: phoneController.text,
        occupation: occupationController.text,
        address: addressController.text,
      ),
    );
  }
}
