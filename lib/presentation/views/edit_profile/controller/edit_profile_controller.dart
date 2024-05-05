import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/components/dialog/image_source_dialog.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../../utils/service/camera_gallery_service.dart';

class EditProfileController extends BaseController<NoArguments, NoState>
    with CameraGalleryService {
  late TextEditingController nameController;
  late TextEditingController occupationController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  RxBool isFileChange = false.obs;
  Rxn<File> imageFile = Rxn<File>(null);

  @override
  void initComponent() {
    nameController = TextEditingController();
    occupationController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void onObserve() {
    requestCameraGalleryPermissions();
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    occupationController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();

    isFileChange.close();
    imageFile.close();
  }

  void openCameraOrGalleryDialog() {
    Get.dialog(
      ImageSourceDialog(
        cameraAction: () async {
          openCamera(
            isPermissionGranted: await requestCameraGalleryPermissions(),
            onImagePicked: (file) {
              imageFile.value = file;
              logger.d("Image file: ${imageFile.value}");
              Get.back();
            },
            onError: (error) {},
          );
        },
        galleryAction: () async {
          openGallery(
            isPermissionGranted: await requestCameraGalleryPermissions(),
            onImagePicked: (file) {
              imageFile.value = file;
              logger.d("Image file: ${imageFile.value}");
              Get.back();
            },
            onError: (error) {},
          );
        },
      ),
    );
  }
}
