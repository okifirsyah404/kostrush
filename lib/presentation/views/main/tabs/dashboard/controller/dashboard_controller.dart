import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/base/base_argument.dart';
import 'package:kostrushapp/domain/repository/main_repository.dart';
import 'package:kostrushapp/presentation/components/focus_node/no_focus_node.dart';
import 'package:kostrushapp/presentation/views/detail_dormitory/arguments/detail_dormitory_argument.dart';
import 'package:kostrushapp/presentation/views/selected_result/argument/selected_result_argument.dart';
import 'package:kostrushapp/res/routes/app_routes.dart';

import '../../../../../../base/base_controller.dart';
import '../../../../../../data/network/response/dashboard_response.dart';
import '../../../../../../res/assets/image_asset_constant.dart';
import '../../../../../components/dialog/main_dialog.dart';
import '../../../../location_result/argument/location_result_argument.dart';

class DashboardController
    extends BaseController<NoArguments, DashboardResponse> {
  final _repository = Get.find<MainRepository>();

  late TextEditingController searchController;

  late NoFocusNode noFocusNode;

  List<Map<String, String>> locationList = [
    {
      "name": "Bagor",
      "imagePath": ImageAssetConstant.locBagor,
    },
    {
      "name": "Baron",
      "imagePath": ImageAssetConstant.locBaron,
    },
    {
      "name": "Brebek",
      "imagePath": ImageAssetConstant.locBrebek,
    },
    {
      "name": "Gondang",
      "imagePath": ImageAssetConstant.locGondang,
    },
    {
      "name": "Jatikalen",
      "imagePath": ImageAssetConstant.locJatikalen,
    },
    {
      "name": "Kertosono",
      "imagePath": ImageAssetConstant.locKertosono,
    },
    {
      "name": "Lengkong",
      "imagePath": ImageAssetConstant.locLengkong,
    },
    {
      "name": "Loceret",
      "imagePath": ImageAssetConstant.locLoceret,
    },
    {
      "name": "Nganjuk",
      "imagePath": ImageAssetConstant.locNganjuk,
    },
    {
      "name": "Ngetos",
      "imagePath": ImageAssetConstant.locNgetos,
    },
    {
      "name": "Ngronggot",
      "imagePath": ImageAssetConstant.locNgronggot,
    },
    {
      "name": "Pace",
      "imagePath": ImageAssetConstant.locPace,
    },
    {
      "name": "Patianrowo",
      "imagePath": ImageAssetConstant.locPatianrowo,
    },
    {
      "name": "Prambon",
      "imagePath": ImageAssetConstant.locPrambon,
    },
    {
      "name": "Rejoso",
      "imagePath": ImageAssetConstant.locRejoso,
    },
    {
      "name": "Sawahan",
      "imagePath": ImageAssetConstant.locSawahan,
    },
    {
      "name": "Sukomoro",
      "imagePath": ImageAssetConstant.locSukomoro,
    },
    {
      "name": "Tanjung Anom",
      "imagePath": ImageAssetConstant.locTanjungAnom,
    },
    {
      "name": "Wilangan",
      "imagePath": ImageAssetConstant.locWilangan,
    },
  ];

  @override
  void initComponent() {
    searchController = TextEditingController();
    noFocusNode = NoFocusNode();
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();

    final data = await _repository.fetchDashboard();

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
        emitSuccess(data);
      },
    );
  }

  void navigateToLocationResult(int index) {
    Get.toNamed(
      AppRoutes.locationResult,
      arguments: LocationResultArgument(
          locationName: locationList[index]["name"] ?? ""),
    );
  }

  void navigateToSearch() {
    Get.toNamed(AppRoutes.search);
  }

  void navigateToDetailDormitory(String id) {
    Get.toNamed(AppRoutes.detailDormitory,
        arguments: DetailDormitoryArgument(dormitoryId: id));
  }

  @override
  void disposeComponent() {
    searchController.dispose();
    noFocusNode.dispose();
  }

  void _navigateToSelectedResult(SelectedResultContext context) {
    Get.toNamed(AppRoutes.selectedResult,
        arguments: SelectedResultArgument(context));
  }

  void navigateToPopularDormitory() {
    _navigateToSelectedResult(SelectedResultContext.popularDormitory);
  }

  void navigateToCheapDormitory() {
    _navigateToSelectedResult(SelectedResultContext.cheapDormitory);
  }
}
