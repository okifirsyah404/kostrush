import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/kost_response.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';
import '../../../../res/routes/app_routes.dart';
import '../../detail_dormitory/argument/detail_dormitory_argument.dart';

class SearchViewController extends BaseController<NoArguments, KostResponse> {
  final _repository = Get.find<MainRepository>();

  late TextEditingController searchController;
  late FocusNode focusNode;

  late Timer _timer;

  @override
  void initComponent() {
    searchController = TextEditingController();
    focusNode = FocusNode();
    _timer = Timer(const Duration(milliseconds: 1200), () {});
  }

  @override
  void onObserve() {
    focusNode.requestFocus();
  }

  @override
  Future<void> onProcess() async {
    searchDormitory();
  }

  Future<void> searchDormitory([String query = ""]) async {
    emitLoading();
    final data = await _repository.searchKost(query);

    data.fold(
      (exception) => emitError(exception.message),
      (result) => emitSuccess(result),
    );
  }

  onChangeSearch(String value) {
    _timer.cancel();
    _timer = Timer(const Duration(milliseconds: 1200), () {
      searchDormitory(value);
    });
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

  @override
  void disposeComponent() {
    focusNode.unfocus();
    searchController.dispose();
    focusNode.dispose();
  }
}
