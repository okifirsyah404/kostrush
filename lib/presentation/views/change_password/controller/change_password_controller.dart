import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/views/change_password/argument/change_password_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../../res/routes/app_routes.dart';
import '../../success/argument/success_argument.dart';

class ChangePasswordController
    extends BaseController<ChangePasswordArgument, NoState> {
  final _repository = Get.find<MainRepository>();

  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;

  @override
  void initComponent() {
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
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
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }

  void changePassword() async {
    if (oldPasswordController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Kata sandi lama tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      return;
    }

    if (newPasswordController.text.isEmpty) {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Kata sandi baru tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    final result = await _repository.changePassword(newPasswordController.text);

    result.fold((exception) {
      emitError(exception.toString());
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text("Something went wrong. Please try again later."),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }, (response) {
      Get.toNamed(
        AppRoutes.success,
        arguments: SuccessArgument(
          context: arguments.context,
          title: "Kata Sandi Berhasil Diubah",
          description:
              "Jangan pernah membagikan kata sandi Anda kepada siapa pun.",
          buttonText: "Kembali ke Halaman Login",
        ),
      );
    });
  }
}
