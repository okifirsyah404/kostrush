import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';
import '../button/main_button.dart';

class MainDialog extends StatelessWidget {
  const MainDialog({
    super.key,
    required this.message,
    this.actions,
  });

  final String message;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        message,
        textAlign: TextAlign.center,
        style: TypographyTheme.labelMedium,
      ),
      actions: actions,
    );
  }

  factory MainDialog.success({
    required String message,
    VoidCallback? onTap,
    String? buttonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: buttonLabel ?? "Ok",
          onTap: onTap ??
              () {
                Get.back();
              },
          color: Colors.green,
          buttonWidth: ButtonWidth.full,
        ),
      ],
    );
  }

  factory MainDialog.error({
    required String message,
    VoidCallback? onTap,
    String? buttonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: buttonLabel ?? "Ok",
          onTap: onTap ??
              () {
                Get.back();
              },
          color: ColorsTheme.errorColor,
          buttonWidth: ButtonWidth.full,
        ),
      ],
    );
  }

  factory MainDialog.warn({
    required String message,
    VoidCallback? onTap,
    String? buttonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: buttonLabel ?? "Ok",
          onTap: onTap ??
              () {
                Get.back();
              },
          color: Colors.amber,
          buttonWidth: ButtonWidth.full,
        ),
      ],
    );
  }

  factory MainDialog.confirmation({
    required String message,
    VoidCallback? onTapConfirm,
    VoidCallback? onTapCancel,
    String? confirmButtonLabel,
    String? cancelButtonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: confirmButtonLabel ?? "Ok",
          onTap: onTapConfirm ??
              () {
                Get.back();
              },
          color: ColorsTheme.primaryColor,
          buttonWidth: ButtonWidth.full,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: Colors.white,
          ),
        ),
        MainButton(
          label: cancelButtonLabel ?? "Kembali",
          onTap: onTapCancel ??
              () {
                Get.back();
              },
          color: ColorsTheme.primaryColor,
          buttonWidth: ButtonWidth.full,
          buttonType: ButtonType.outlined,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: ColorsTheme.primaryColor,
          ),
        ),
      ],
    );
  }

  factory MainDialog.confirmationSuccess({
    required String message,
    VoidCallback? onTapConfirm,
    VoidCallback? onTapCancel,
    String? confirmButtonLabel,
    String? cancelButtonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: confirmButtonLabel ?? "Ok",
          onTap: onTapConfirm ??
              () {
                Get.back();
              },
          color: Colors.green,
          buttonWidth: ButtonWidth.full,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: Colors.white,
          ),
        ),
        MainButton(
          label: cancelButtonLabel ?? "Kembali",
          onTap: onTapCancel ??
              () {
                Get.back();
              },
          color: Colors.green,
          buttonWidth: ButtonWidth.full,
          buttonType: ButtonType.outlined,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  factory MainDialog.confirmationWarn({
    required String message,
    VoidCallback? onTapConfirm,
    VoidCallback? onTapCancel,
    String? confirmButtonLabel,
    String? cancelButtonLabel,
  }) {
    return MainDialog(
      message: message,
      actions: [
        MainButton(
          label: confirmButtonLabel ?? "Ok",
          onTap: onTapConfirm ??
              () {
                Get.back();
              },
          color: ColorsTheme.errorColor,
          buttonWidth: ButtonWidth.full,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: Colors.white,
          ),
        ),
        MainButton(
          label: cancelButtonLabel ?? "Kembali",
          onTap: onTapCancel ??
              () {
                Get.back();
              },
          color: ColorsTheme.errorColor,
          buttonWidth: ButtonWidth.full,
          buttonType: ButtonType.outlined,
          textStyle: TypographyTheme.labelMedium.copyWith(
            color: ColorsTheme.errorColor,
          ),
        ),
      ],
    );
  }
}
