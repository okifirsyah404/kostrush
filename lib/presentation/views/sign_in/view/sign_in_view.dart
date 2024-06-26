import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/components/input/main_password_text_input.dart';
import 'package:kostrushapp/presentation/components/input/main_text_input.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/presentation/themes/typography_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';

import '../../../../../base/base_view.dart';
import '../../../../../res/assets/svg_asset_constant.dart';
import '../controller/sign_in_controller.dart';

/// Kelas SignInView adalah kelas yang mewakili tampilan untuk halaman masuk.
/// Kelas ini merupakan turunan dari kelas BaseView dan menggunakan SignInController sebagai kontrolernya.
class SignInView extends BaseView<SignInController> {
  const SignInView({super.key});

  /// Mengembalikan widget AppBar yang diinginkan untuk tampilan SignIn.
  ///
  /// Jika tidak ada AppBar yang diperlukan, maka akan mengembalikan null.
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context, state) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang di",
              style: TypographyTheme.titleMedium,
            ),
            Text(
              "KostRush Nganjuk",
              style: TypographyTheme.titleMedium,
            ),
            SvgPicture.asset(
              SvgAssetConstant.logo,
              width: 320,
            ),
            _formBuilder(),
            gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Belum punya Akun?",
                ),
                gap(8),
                InkWell(
                  onTap: () {
                    /// Navigasi ke halaman pendaftaran.
                    controller.navigateToSignUp();
                  },
                  child: Text(
                    "Daftar Di Sini",
                    style: TypographyTheme.labelMedium
                        .copyWith(color: ColorsTheme.primaryColor[700]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  /// Widget untuk membangun form.
  Widget _formBuilder() {
    return Container(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            MainTextInput(
              controller: controller.emailController,
              label: "Email",
              inputType: TextInputType.emailAddress,
              validator: MainTextInputValidator.email,
            ),
            gap(8),
            MainPasswordTextInput(
              controller: controller.passwordController,
            ),
            gap(16),
            MainButton(
              onTap: () {
                /// Memanggil metode `signIn()` pada objek `controller`.
                controller.signIn();
              },
              label: "Masuk",
              buttonWidth: ButtonWidth.full,
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk menampilkan pemisah antara elemen-elemen autentikasi.
  Widget _authDivider() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text("Atau"),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
