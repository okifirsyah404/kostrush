import 'package:get/get.dart';
import 'package:kostrushapp/app/views/main/tabs/dashboard/view/dashboard_view.dart';
import 'package:kostrushapp/app/views/main/tabs/profile/view/profile_view.dart';
import 'package:kostrushapp/app/views/main/tabs/transaction/view/transaction_view.dart';

import '../../../../base/base_controller.dart';
import '../tabs/dashboard/controller/dashboard_controller.dart';
import '../tabs/profile/controller/profile_controller.dart';
import '../tabs/transaction/controller/transaction_controller.dart';

class MainController extends GetxController {
  final selectedIndex = 0.obs;

  final pageViews = const [
    DashboardView(),
    TransactionView(),
    ProfileView(),
  ];

  final List<BaseController> pageControllers = [
    Get.find<DashboardController>(),
    Get.find<TransactionController>(),
    Get.find<ProfileController>(),
  ];

  void onPageChange(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        pageControllers[0].onInit();
        break;
      case 1:
        pageControllers[1].onInit();
        break;
      case 2:
        pageControllers[2].onInit();
        break;
    }
  }
}