import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ImageSourceDialog extends GetView {
  const ImageSourceDialog({
    super.key,
    required this.cameraAction,
    required this.galleryAction,
  });
  final Function() cameraAction;
  final Function() galleryAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Ambil Dari Kamera"),
              leading: const FaIcon(FontAwesomeIcons.camera),
              onTap: cameraAction,
            ),
            ListTile(
              title: Text("Ambil Dari Galeri"),
              leading: const FaIcon(FontAwesomeIcons.image),
              onTap: galleryAction,
            ),
          ],
        ),
      ),
    );
  }
}
