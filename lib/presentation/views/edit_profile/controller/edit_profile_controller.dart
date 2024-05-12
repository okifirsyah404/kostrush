import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/model/profile_model.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';

class EditProfileController extends BaseController<NoArguments, ProfileModel> {
  final _mainRepository = Get.find<MainRepository>();

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
    emitLoading();

    final data = await _mainRepository.getProfile();

    data.fold((exception) {
      emitError(exception.toString());
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Something went wrong. Please try again later."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
    }, (response) {
      emitSuccess(response);

      nameController.text = response.name ?? "";
      occupationController.text = response.occupation ?? "";
      phoneController.text = response.phoneNumber ?? "";
      addressController.text = response.address ?? "";
      emailController.text = response.email ?? "";
    });
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
