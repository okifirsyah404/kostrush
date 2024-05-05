import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/domain/repository/auth_repository.dart';
import 'package:kostrushapp/presentation/components/dialog/main_dialog.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../base/base_controller.dart';

class SignInController extends BaseController<NoArguments, NoState> {
  final _repository = Get.find<AuthRepository>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initComponent() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
  }

  void signIn() async {
    // Get.offNamed(AppRoutes.main);

    if (formKey.currentState!.validate()) {
      final data = await _repository.login(
        emailController.text,
        passwordController.text,
      );

      data.fold(
        (exception) {
          Get.dialog(
            MainDialog.error(
              message: exception.message ?? 'Error',
            ),
          );
        },
        (_) {
          Get.offNamed(AppRoutes.main);
        },
      );
    }
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  void navigateToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
