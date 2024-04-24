import 'package:flutter/material.dart';
import 'package:kostrushapp/app/components/button/main_button.dart';
import 'package:kostrushapp/app/components/input/main_text_input.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/forget_password_controller.dart';

class ForgetPasswordView extends BaseView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Lupa Kata Sandi",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Silahkan masukkan email Anda"),
          gap(8),
          MainTextInput(
            controller: controller.emailController,
            label: "Email",
            inputType: TextInputType.emailAddress,
            validator: MainTextInputValidator.email,
          ),
          gap(16),
          MainButton(
            label: "Kirim Kode OTP",
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.navigateToOtp();
            },
          )
        ],
      ),
    );
  }
}
