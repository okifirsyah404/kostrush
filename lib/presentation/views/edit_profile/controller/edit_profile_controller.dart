import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class EditProfileController extends BaseController<NoArguments, NoState> {
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
  void onObserve() {}

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
}
