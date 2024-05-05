import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';
import 'package:kostrushapp/presentation/views/detail_dormitory/arguments/detail_dormitory_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../components/dialog/main_dialog.dart';

class DetailDormitoryController
    extends BaseController<DetailDormitoryArgument, DormitoryResponse> {
  final _repository = Get.find<MainRepository>();

  late PageController pageController;

  RxInt currentIndex = 0.obs;

  RxList<String> imageList = RxList([]);

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
    emitLoading();

    final data = await _repository.fetchDormitoryDetail(arguments.dormitoryId);

    data.fold(
      (exception) {
        emitError(exception.message);
        Get.dialog(
          MainDialog.error(
            message: exception.message ?? 'Error',
          ),
        );
      },
      (data) {
        imageList.assignAll(data.dormitoryImage.map((e) => e.url).toList());
        emitSuccess(data);
      },
    );
  }

  @override
  void disposeComponent() {
    pageController.dispose();
    currentIndex.close();
    imageList.close();
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

  void intentToMap() async {
    var uri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=${state?.dormitoryLocation.latitude},${state?.dormitoryLocation.longitude}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
