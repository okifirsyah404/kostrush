import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class DetailDormitoryController extends BaseController<NoArguments, NoState> {
  late PageController pageController;

  RxInt currentIndex = 0.obs;

  List<String> imageList = [
    ImageAssetConstant.dormPlaceholder,
    ImageAssetConstant.dormPlaceholder2,
    ImageAssetConstant.dormPlaceholder3,
    ImageAssetConstant.dormPlaceholder4,
  ];

  @override
  void initComponent() {
    pageController = PageController();
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
    pageController.dispose();
    currentIndex.close();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void navigateToOrderForm() {
    Get.toNamed(AppRoutes.orderForm);
  }
}
