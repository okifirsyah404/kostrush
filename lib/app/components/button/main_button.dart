import 'package:flutter/material.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';

enum ButtonType { filled, outlined, text }

enum PrefixIcon { none, icon }

enum ButtonWidth { full, wrap }

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.buttonType = ButtonType.filled,
    this.buttonWidth = ButtonWidth.wrap,
    required this.label,
    this.onTap,
    this.color,
    this.icon,
    this.iconData,
    this.textStyle,
    this.borderRadius = 8,
  });

  final ButtonType buttonType;
  final ButtonWidth buttonWidth;
  final String label;
  final Function()? onTap;
  final Color? color;
  final Widget? icon;
  final IconData? iconData;
  final TextStyle? textStyle;
  final double? borderRadius;

  factory MainButton.icon({
    required String label,
    Function()? onTap,
    Color? color,
    required Widget icon,
    ButtonType buttonType = ButtonType.filled,
    ButtonWidth buttonWidth = ButtonWidth.wrap,
    TextStyle? textStyle,
  }) {
    return MainButton(
      label: label,
      onTap: onTap,
      color: color,
      icon: icon,
      buttonType: buttonType,
      buttonWidth: buttonWidth,
      textStyle: textStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.filled:
        return icon != null
            ? _buildFilledButtonWithIcon()
            : _buildFilledButton();

      case ButtonType.outlined:
        return icon != null
            ? _buildOutlinedButtonWithIcon()
            : _buildOutlinedButton();

      case ButtonType.text:
        return icon != null ? _buildTextButtonWithIcon() : _buildTextButton();

      default:
        return const SizedBox();
    }
  }

  Widget _buildFilledButton() => FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          shape: borderRadius == null
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
          minimumSize: buttonWidth == ButtonWidth.full
              ? const Size.fromHeight(48)
              : null,
          backgroundColor: color ?? ColorsTheme.primaryColor,
        ),
        child: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.neutralColor[1000],
              ),
        ),
      );

  Widget _buildFilledButtonWithIcon() => FilledButton.icon(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          shape: borderRadius == null
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
          minimumSize: buttonWidth == ButtonWidth.full
              ? const Size.fromHeight(48)
              : null,
          backgroundColor: color ?? ColorsTheme.neutralColor[1000],
        ),
        icon: icon ?? const SizedBox(),
        label: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.primaryColor,
              ),
        ),
      );

  Widget _buildOutlinedButton() => OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: borderRadius == null
              ? const StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
          minimumSize: buttonWidth == ButtonWidth.full
              ? const Size.fromHeight(48)
              : null,
          side: BorderSide(width: 1, color: color ?? ColorsTheme.primaryColor),
        ),
        child: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.primaryColor,
              ),
        ),
      );

  Widget _buildOutlinedButtonWithIcon() => OutlinedButton.icon(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: borderRadius == null
              ? StadiumBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                ),
          minimumSize: buttonWidth == ButtonWidth.full
              ? const Size.fromHeight(48)
              : null,
          side: BorderSide(width: 1, color: color ?? ColorsTheme.primaryColor),
        ),
        icon: icon ?? const SizedBox(),
        label: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.primaryColor,
              ),
        ),
      );

  Widget _buildTextButton() => TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.primaryColor,
              ),
        ),
      );

  Widget _buildTextButtonWithIcon() => TextButton.icon(
        onPressed: onTap,
        icon: icon ?? const SizedBox(),
        label: Text(
          label,
          style: textStyle ??
              TypographyTheme.labelMedium.copyWith(
                color: color ?? ColorsTheme.primaryColor,
              ),
        ),
      );
}
