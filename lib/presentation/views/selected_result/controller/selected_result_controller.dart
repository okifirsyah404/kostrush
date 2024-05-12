import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';
import 'package:kostrushapp/presentation/views/selected_result/argument/selected_result_argument.dart';

import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../../res/routes/app_routes.dart';
import '../../detail_dormitory/argument/detail_dormitory_argument.dart';

class SelectedResultController
    extends BaseController<SelectedResultArgument, KostResponse> {
  final _repository = Get.find<MainRepository>();

  @override
  void initComponent() {
    // TODO: implement initComponent
  }

  @override
  void onObserve() {
    // TODO: implement onObserve
  }

  @override
  Future<void> onProcess() async {
    emitLoading();
    final result = await _repository.getRecommendedKost();

    result.fold(
      (exception) {
        emitError(exception.message);
        if (exception.response?.statusCode != 404) {
          Get.dialog(AlertDialog(
            title: Text("Error"),
            content: Text("Terjadi kesalahan saat mengambil data dari server"),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"),
              ),
            ],
          ));
        }
      },
      (result) => emitSuccess(result),
    );
  }

  @override
  void disposeComponent() {
    // TODO: implement disposeComponent
  }

  void navigateToDetailDormitory(Kost? kost) {
    if (kost != null) {
      Get.toNamed(AppRoutes.detailDormitory,
          arguments: DetailDormitoryArgument(kost));
    } else {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("Data tidak ditemukan"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ));
    }
  }

  String get title {
    switch (arguments.context) {
      case SelectedResultContext.popularDormitory:
        return "Kost Populer";
      case SelectedResultContext.cheapDormitory:
        return "Kost Termurah";
    }
  }
}
