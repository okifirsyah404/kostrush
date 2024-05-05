import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostrushapp/data/network/response/dormitory_response.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../domain/repository/main_repository.dart';

class SearchViewController
    extends BaseController<NoArguments, List<DormitoryResponse>> {
  final _repository = Get.find<MainRepository>();
  late Timer _timer;

  late TextEditingController searchController;
  late FocusNode focusNode;

  @override
  void initComponent() {
    searchController = TextEditingController();
    focusNode = FocusNode();
    _timer = Timer(const Duration(milliseconds: 500), () {});
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
    final data = await _repository.searchDormitory(query);

    data.fold(
      (exception) => emitError(exception.message),
      (result) => emitSuccess(result),
    );
  }

  onChangeSearch(String value) {
    _timer.cancel();
    _timer = Timer(const Duration(milliseconds: 300), () {
      searchDormitory(value);
    });
  }

  @override
  void disposeComponent() {
    focusNode.unfocus();
    searchController.dispose();
    focusNode.dispose();
  }
}
