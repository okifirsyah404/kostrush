import 'package:flutter/material.dart';

import '../Style/StyleApp.dart';

class RegularListView extends StatelessWidget {
  final EdgeInsets? margin;
  final Image image;
  final String labelText;
  final TextStyle? labelStyle;
  final String descriptionText;
  final TextStyle? descriptionStyle;
  final Color? containerColor;
  final Color? borderColor;
  final double containerOpacity;
  final double borderOpacity;
  final BorderRadius? containerRadius;
  final BorderRadius? borderRadius;
  final double borderSize;
  final List<Widget> children;
  final Function? onTap;

  const RegularListView({
    Key? key,
    this.margin,
    required this.image,
    required this.labelText,
    this.labelStyle,
    required this.descriptionText,
    this.descriptionStyle,
    this.containerColor,
    this.borderColor,
    this.containerOpacity = 1.0,
    this.borderOpacity = 1.0,
    this.containerRadius,
    this.borderRadius,
    this.borderSize = 1,
    this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => onTap!(index),
          child: Container(
            margin: margin,
            decoration: BoxDecoration(
              color: containerColor?.withOpacity(containerOpacity),
              borderRadius: containerRadius,
              border: Border.all(
                color: borderColor?.withOpacity(borderOpacity) ?? Colors.transparent,
                width: borderSize,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      image,
                      SizedBox(width: 10),
                      Text(
                        labelText,
                        style: labelStyle ?? StyleApp.mediumTextStyle.copyWith(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    descriptionText,
                    style: descriptionStyle ?? StyleApp.mediumTextStyle.copyWith(),
                  ),
                ),
                children[index],
              ],
            ),
          ),
        );
      },
    );
  }
}
