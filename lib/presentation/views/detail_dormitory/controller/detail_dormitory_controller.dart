import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/presentation/views/detail_dormitory/argument/detail_dormitory_argument.dart';
import 'package:kostrushapp/res/assets/image_asset_constant.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';
import '../../order_form/argument/order_form_argument.dart';

class DetailDormitoryController
    extends BaseController<DetailDormitoryArgument, NoState> {
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
    if (arguments.kost.id != null) {
      Get.toNamed(AppRoutes.orderForm,
          arguments: OrderFormArgument(
            kostId: arguments.kost.id.toString(),
            kostName: arguments.kost.name ?? "",
            roomId: arguments.kost.id.toString(),
            price: arguments.kost.startPrice ?? 0,
          ));
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Error"),
          content: const Text("Kost id tidak boleh kosong"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
