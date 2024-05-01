import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/views/duration_selector/argument/duration_selector_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:kostrushapp/utils/extensions/base_controller_ext.dart';
import 'package:kostrushapp/utils/extensions/date_time_ext.dart';
import 'package:kostrushapp/utils/service/camera_gallery_service.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../../components/focus_node/no_focus_node.dart';

class OrderFormController extends BaseController<NoArguments, NoState>
    with CameraGalleryService {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController occupationController;
  late TextEditingController dateController;
  late TextEditingController durationController;

  late NoFocusNode noFocusNode;

  Rxn<File> selectedFile = Rxn<File>();
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<DurationItem> selectedDuration = Rxn<DurationItem>();

  @override
  void initComponent() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    occupationController = TextEditingController();
    dateController = TextEditingController();
    durationController = TextEditingController();
    noFocusNode = NoFocusNode();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    nameController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    dateController.dispose();
    durationController.dispose();
    noFocusNode.dispose();

    selectedFile.value = null;
    selectedFile.close();
    selectedDate.value = null;
    selectedDate.close();
    selectedDuration.value = null;
    selectedDuration.close();
  }

  void launchGallery() async {
    openGallery(
        isPermissionGranted: await requestCameraGalleryPermissions(),
        onImagePicked: (file) {
          selectedFile.value = file;
        },
        onError: (error) {
          logger.e(error);
        });
  }

  void pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      locale: const Locale("id", "ID"),
    ).then((value) {
      if (value != null) {
        selectedDate.value = value;
        dateController.text = selectedDate.value!.formatDate();
      }
    });
  }

  void navigateToDurationSelector() async {
    var result = await Get.toNamed(
      AppRoutes.selectDuration,
      arguments: DurationSelectorArgument(
        duration: selectedDuration.value,
      ),
    );

    logger.d("Result: $result");
    logger.d("Result: ${result.duration}");

    if (result != null && result is DurationSelectorArgument) {
      selectedDuration.value = result.duration;
      durationController.text = selectedDuration.value!.duration;
    }
  }
}
