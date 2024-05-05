import 'package:flutter/material.dart';

import '../../../../base/base_argument.dart';
import '../../../../base/base_controller.dart';
import '../../../../base/base_state.dart';

class SearchViewController extends BaseController<NoArguments, NoState> {
  late TextEditingController searchController;
  late FocusNode focusNode;

  @override
  void initComponent() {
    searchController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onObserve() {
    focusNode.requestFocus();
  }

  @override
  Future<void> onProcess() async {
    // TODO: implement onProcess
  }

  @override
  void disposeComponent() {
    focusNode.unfocus();
    searchController.dispose();
    focusNode.dispose();
  }
}
