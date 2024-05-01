import 'package:flutter/material.dart';
import 'package:kostrushapp/presentation/components/button/main_button.dart';
import 'package:kostrushapp/presentation/themes/color_theme.dart';
import 'package:kostrushapp/utils/extensions/base_view_ext.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../../base/base_view.dart';
import '../../../components/appbar/default_appbar.dart';
import '../controller/otp_controller.dart';

class OtpView extends BaseView<OtpController> {
  const OtpView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return DefaultAppBar(
      appbarTitle: "Kode Otp",
    );
  }

  @override
  Widget body(BuildContext context, state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Masukkan Kode OTP yang telah dikirim ke alamat email Anda",
          ),
          gap(16),
          Container(
            child: PinInputTextField(
              decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(
                  ColorsTheme.primaryColor,
                  Colors.grey,
                ),
                strokeWidth: 1.2,
                gapSpace: 8,
                radius: Radius.circular(100),
              ),
              pinLength: 4,
              controller: controller.otpController,
            ),
          ),
          gap(16),
          Row(
            children: [
              Text(
                "Belum menerima kode OTP?",
              ),
              gap(8),
              InkWell(
                onTap: () {
                  // controller.resendOtp();
                },
                child: Text(
                  "Kirim Ulang",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
          gap(16),
          MainButton(
            label: "Konfirmasi",
            buttonWidth: ButtonWidth.full,
            onTap: () {
              controller.sendOtp();
            },
          ),
        ],
      ),
    );
  }
}
