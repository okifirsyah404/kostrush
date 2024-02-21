import 'package:flutter/material.dart';

import '../Style/StyleApp.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final BorderRadius? borderRadius;
  final double borderSize;
  final EdgeInsets? margin;
  final TextAlign textAlign;
  final String? labelText;
  final TextStyle? labelStyle;
  final int maxLinesLabel;
  final String? hintText;
  final Icon? icon;
  final Color? containerColor;
  final Color? borderColor;
  final double containerOpacity;
  final double borderOpacity;

  const RegularTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.labelText,
    this.labelStyle,
    this.maxLinesLabel = 1,
    this.hintText,
    this.margin,
    this.borderRadius,
    this.borderSize = 1,
    this.textAlign = TextAlign.left,
    this.containerColor,
    this.borderColor,
    this.containerOpacity = 1.0,
    this.borderOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color labelColor = themeData.brightness == Brightness.light ? Colors.black : Colors.white;

    List<Widget> widgets = [];

    // Fungsi untuk menambahkan labelText diatas TextFormField
    if (labelText != null && labelText!.isNotEmpty) {
      widgets.add(
        Text(
          labelText!,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLinesLabel,
          style: labelStyle ?? StyleApp.mediumTextStyle.copyWith(color: labelColor),
        ),
      );
      widgets.add(const SizedBox(height: 5));
    }

    widgets.add(
      Container(
        margin: margin,
        decoration: BoxDecoration(
          color: containerColor?.withOpacity(containerOpacity),
          borderRadius: borderRadius,
          border: Border.all(
            color: borderColor?.withOpacity(borderOpacity) ?? Colors.transparent,
            width: borderSize,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: labelColor,
            style: StyleApp.mediumInputTextStyle.copyWith(
              color: labelColor,
            ),
            textAlign: textAlign,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }
}