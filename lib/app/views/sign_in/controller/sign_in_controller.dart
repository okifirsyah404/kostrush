import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/base/base_state.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../base/base_controller.dart';

class SignInController extends BaseController<NoArguments, NoState> {
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

  void signIn() {
    Get.offNamed(AppRoutes.main);
    // if (formKey.currentState!.validate()) {
    // }
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  void navigateToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
